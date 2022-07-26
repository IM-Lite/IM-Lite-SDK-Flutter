import 'dart:convert';
import 'package:fixnum/fixnum.dart';
import 'package:im_lite_core_flutter/im_lite_core_flutter.dart';
import 'package:im_lite_sdk_flutter/src/constant/content_type.dart';
import 'package:im_lite_sdk_flutter/src/constant/send_status.dart';
import 'package:im_lite_sdk_flutter/src/listener/conv_listener.dart';
import 'package:im_lite_sdk_flutter/src/listener/msg_listener.dart';
import 'package:im_lite_sdk_flutter/src/listener/unread_count_listener.dart';
import 'package:im_lite_sdk_flutter/src/model/conv_model.dart';
import 'package:im_lite_sdk_flutter/src/model/msg_model.dart';
import 'package:im_lite_sdk_flutter/src/model/read_model.dart';
import 'package:im_lite_sdk_flutter/src/model/sdk_content.dart';
import 'package:im_lite_sdk_flutter/src/tool/sdk_tool.dart';
import 'package:isar/isar.dart';

class SDKManager {
  final int pullMsgCount;
  final bool isarInspector;
  final ConvListener? convListener;
  final MsgListener? msgListener;
  final UnreadCountListener? unreadCountListener;

  SDKManager({
    required this.pullMsgCount,
    required this.isarInspector,
    this.convListener,
    this.msgListener,
    this.unreadCountListener,
  });

  late String userID;
  late Isar isar;

  /// 打开数据库
  Future openDatabase({
    required String userID,
  }) async {
    this.userID = userID;
    isar = await Isar.open(
      schemas: [
        ConvModelSchema,
        MsgModelSchema,
      ],
      name: userID,
      inspector: isarInspector,
    );
  }

  /// 关闭数据库
  Future closeDatabase() async {
    await isar.close();
  }

  /// 会话表
  IsarCollection<ConvModel> convModels() {
    return isar.convModels;
  }

  /// 消息表
  IsarCollection<MsgModel> msgModels() {
    return isar.msgModels;
  }

  /// 已读表
  IsarCollection<ReadModel> readModels() {
    return isar.readModels;
  }

  /// 拉取会话
  void onPullConv(ConvDataList? convList) async {
    if (convList == null) return;
    List<PullMsg> pullList = [];
    await isar.writeTxn((isar) async {
      List<ConvModel> convModelList = await convModels().where().findAll();
      for (ConvData conv in convList.list) {
        PullMsg? pull = await _handleConv(convModelList, conv);
        if (pull != null) pullList.add(pull);
      }
      for (ConvModel convModel in convModelList) {
        await convModels().delete(convModel.id!);
        await msgModels().filter().convIDEqualTo(convModel.convID).deleteAll();
      }
      convListener?.update();
      await _calculateUnreadCount();
    });
    if (pullList.isNotEmpty) {
      await pullMsgList(
        isAutoPull: true,
        pullList: pullList,
      );
    }
  }

  /// 处理会话
  Future<PullMsg?> _handleConv(
    List<ConvModel> convModelList,
    ConvData conv,
  ) async {
    int index = convModelList.indexWhere((item) {
      return item.convID == conv.convID;
    });
    ConvModel? convModel;
    if (index != -1) {
      convModel = convModelList.removeAt(index);
    }
    if (convModel != null) {
      convModel.maxSeq = conv.maxSeq;
      convModel.minSeq = conv.minSeq;
    } else {
      convModel = ConvModel.fromProtobuf(conv);
    }
    await convModels().put(convModel);
    int maxSeq = convModel.maxSeq;
    int minSeq = convModel.minSeq;
    MsgModel? msgModel = await msgModels()
        .filter()
        .convIDEqualTo(
          convModel.convID,
        )
        .sortBySeqDesc()
        .findFirst();
    if (msgModel != null && msgModel.seq != 0) {
      minSeq = msgModel.seq;
    }
    if (maxSeq - minSeq > pullMsgCount) {
      minSeq = maxSeq - pullMsgCount;
    }
    List<int> seqList = SDKTool.generateSeqList(maxSeq, minSeq);
    if (seqList.isNotEmpty) {
      return PullMsg(
        convID: convModel.convID,
        seqList: seqList,
      );
    }
    return null;
  }

  /// 拉取消息
  Future<List<MsgModel>> pullMsgList({
    required bool isAutoPull,
    required List<PullMsg> pullList,
  }) async {
    MsgDataList? msgList = await IMLiteCore.instance.pullMsgList(
      pullList: PullMsgList(list: pullList),
    );
    List<MsgModel> list = [];
    if (msgList != null) {
      await isar.writeTxn((isar) async {
        for (MsgData msg in msgList.list) {
          MsgModel msgModel = MsgModel.fromProtobuf(msg);
          list.add(msgModel);
          if (isAutoPull) {
            await _handleMsg(msg);
          } else {
            await _updateMsg(msgModel);
          }
        }
      });
    }
    return list;
  }

  /// 推送消息
  void onPushMsg(MsgData msg) async {
    await isar.writeTxn((isar) async {
      await _handleMsg(msg);
    });
  }

  /// 处理消息
  Future _handleMsg(MsgData msg) async {
    if (msg.serverMsgID.isEmpty) return;
    MsgModel msgModel = MsgModel.fromProtobuf(msg);
    msgModel.sendStatus = SendStatus.success;
    _updateMsg(msgModel);
    msgListener?.receive(msgModel);
    ReadModel? readModel = await _updateRead(msgModel);
    _updateConv(msgModel, readModel);
  }

  Future _updateMsg(MsgModel msgModel) async {
    if (!msgModel.msgOptions.storage) return;
    MsgModel? model = await msgModels()
        .filter()
        .clientMsgIDEqualTo(
          msgModel.clientMsgID,
        )
        .findFirst();
    if (model != null) {
      if (model.seq != 0) {
        if (msgModel.seq > model.seq) {
          model.contentType = msgModel.contentType;
          model.content = msgModel.content;
          await msgModels().put(model);
        }
      } else {
        model.serverMsgID = msgModel.serverMsgID;
        model.contentType = msgModel.contentType;
        model.content = msgModel.content;
        model.seq = msgModel.seq;
        model.serverTime = msgModel.serverTime;
        await msgModels().put(model);
      }
    } else {
      await msgModels().put(msgModel);
    }
  }

  Future<ReadModel?> _updateRead(MsgModel msgModel) async {
    if (msgModel.contentType != ContentType.read) return null;
    ReadContent content = ReadContent.fromJson(msgModel.content);
    ReadModel? readModel = await readModels()
        .filter()
        .senderIDEqualTo(msgModel.senderID)
        .convIDEqualTo(msgModel.convID)
        .findFirst();
    if (readModel != null) {
      if (content.seq > readModel.seq) {
        readModel.seq = content.seq;
        await readModels().put(readModel);
      }
    } else {
      readModel = ReadModel(
        senderID: msgModel.senderID,
        convID: msgModel.convID,
        seq: content.seq,
      );
      await readModels().put(readModel);
    }
    return readModel;
  }

  Future _updateConv(MsgModel msgModel, ReadModel? readModel) async {
    ConvModel? convModel = await convModels()
        .filter()
        .convIDEqualTo(
          msgModel.convID,
        )
        .findFirst();
    if (convModel != null) {
      if (msgModel.seq > convModel.maxSeq) {
        convModel.maxSeq = msgModel.seq;
      }
      if (readModel != null) {
        int unreadCount = convModel.maxSeq - readModel.seq;
        convModel.unreadCount = unreadCount > 0 ? unreadCount : 0;
      }
      if (msgModel.msgOptions.unread && msgModel.senderID != userID) {
        convModel.unreadCount = ++convModel.unreadCount;
      }
      if (msgModel.msgOptions.updateConv) {
        convModel.msgModel = msgModel;
        convModel.msgTime = msgModel.serverTime;
      }
      await convModels().put(convModel);
      convListener?.update();
      await _calculateUnreadCount();
    }
  }

  /// 计算未读数量
  Future _calculateUnreadCount() async {
    int count = await convModels().where().unreadCountProperty().sum();
    unreadCountListener?.unreadCount(count);
  }

  /// 创建消息
  MsgModel createMsg({
    String? clientMsgID,
    required String convID,
    required int contentType,
    required String content,
    required OfflinePushModel offlinePush,
    required MsgOptionsModel msgOptions,
  }) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    MsgModel msgModel = MsgModel(
      clientMsgID: clientMsgID ?? SDKTool.getClientMsgID(),
      senderID: userID,
      convID: convID,
      contentType: contentType,
      content: content,
      clientTime: timestamp,
      serverTime: timestamp,
      offlinePush: offlinePush,
      msgOptions: msgOptions,
    );
    return msgModel;
  }

  /// 发送消息
  Future<bool> sendMsg({
    required MsgModel msgModel,
  }) async {
    if (msgModel.msgOptions.storage) {
      await isar.writeTxn((isar) async {
        await msgModels().put(msgModel);
      });
    }
    bool sendStatus = await IMLiteCore.instance.sendMsg(
      msg: MsgData(
        clientMsgID: msgModel.clientMsgID,
        senderID: userID,
        convID: msgModel.convID,
        contentType: msgModel.contentType,
        content: utf8.encode(msgModel.content),
        clientTime: Int64(msgModel.clientTime),
        offlinePush: OfflinePush(
          title: msgModel.offlinePush.title,
          desc: msgModel.offlinePush.desc,
          ex: msgModel.offlinePush.ex,
          iOSPushSound: msgModel.offlinePush.iOSPushSound,
          iOSBadgeCount: msgModel.offlinePush.iOSBadgeCount,
          userIDs: msgModel.offlinePush.userIDs,
        ),
        msgOptions: MsgOptions(
          storage: msgModel.msgOptions.storage,
          unread: msgModel.msgOptions.unread,
          updateConv: msgModel.msgOptions.updateConv,
        ),
      ),
    );
    if (sendStatus) {
      if (msgModel.msgOptions.storage) {
        await isar.writeTxn((isar) async {
          msgModel.sendStatus = SendStatus.success;
          await msgModels().put(msgModel);
        });
      }
    } else {
      if (msgModel.msgOptions.storage) {
        await isar.writeTxn((isar) async {
          msgModel.sendStatus = SendStatus.failed;
          await msgModels().put(msgModel);
        });
      }
    }
    return sendStatus;
  }
}
