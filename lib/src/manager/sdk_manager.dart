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
import 'package:im_lite_sdk_flutter/src/model/record_model.dart';
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

  /// 记录表
  IsarCollection<RecordModel> recordModels() {
    return isar.recordModels;
  }

  /// 拉取会话
  void pullConv(ConvDataList? convList) async {
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
      IMLiteCore.instance.pullMsgList(
        pullList: PullMsgList(
          list: pullList,
        ),
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
  void pullMsg(MsgDataList? msgList) async {
    if (msgList == null) return;
    await isar.writeTxn((isar) async {
      for (MsgData msg in msgList.list) {
        await _handleMsg(msg);
      }
    });
  }

  /// 推送消息
  void pushMsg(MsgData msg) async {
    await isar.writeTxn((isar) async {
      await _handleMsg(msg);
    });
  }

  /// 处理消息
  Future _handleMsg(MsgData msg) async {
    if (msg.serverMsgID.isEmpty) return;
    MsgModel msgModel = MsgModel.fromProtobuf(msg);
    msgModel.sendStatus = SendStatus.success;
    MsgOptionsModel msgOptions = msgModel.msgOptions;
    bool storage = msgOptions.storage;
    bool unread = msgOptions.unread;
    if (storage) {
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
    msgListener?.receive(msgModel);
    RecordModel? recordModel;
    if (msgModel.contentType == ContentType.read) {
      ReadContent content = ReadContent.fromJson(msgModel.content);
      recordModel = await recordModels()
          .filter()
          .senderIDEqualTo(msgModel.senderID)
          .convIDEqualTo(msgModel.convID)
          .findFirst();
      if (recordModel != null) {
        if (content.seq > recordModel.seq) {
          recordModel.seq = content.seq;
          await recordModels().put(recordModel);
        }
      } else {
        recordModel = RecordModel(
          senderID: msgModel.senderID,
          convID: msgModel.convID,
          seq: content.seq,
        );
        await recordModels().put(recordModel);
      }
    }
    ConvModel? convModel = await convModels()
        .filter()
        .convIDEqualTo(
          msgModel.convID,
        )
        .findFirst();
    if (convModel != null) {
      convModel.maxSeq = msgModel.seq;
      if (msgModel.contentType >= ContentType.text) {
        convModel.msgModel = msgModel;
        convModel.msgTime = msgModel.serverTime;
      }
      if (recordModel != null) {
        int unreadCount = convModel.maxSeq - recordModel.seq;
        convModel.unreadCount = unreadCount > 0 ? unreadCount : 0;
      }
      if (unread && msgModel.senderID != userID) {
        convModel.unreadCount = ++convModel.unreadCount;
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
  void sendMsg({
    required MsgModel msgModel,
    Function()? onSuccess,
    Function()? onError,
  }) async {
    bool storage = msgModel.msgOptions.storage;
    if (storage) {
      await isar.writeTxn((isar) async {
        await msgModels().put(msgModel);
        ConvModel? convModel = await convModels()
            .filter()
            .convIDEqualTo(
              msgModel.convID,
            )
            .findFirst();
        if (convModel != null) {
          convModel.msgModel = msgModel;
          convModel.msgTime = msgModel.serverTime;
          await convModels().put(convModel);
          convListener?.update();
        }
      });
    }
    IMLiteCore.instance.sendMsg(
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
        ),
      ),
      onSuccess: (data) async {
        if (storage) {
          await isar.writeTxn((isar) async {
            msgModel.sendStatus = SendStatus.success;
            await msgModels().put(msgModel);
          });
        }
        if (onSuccess != null) onSuccess();
      },
      onError: (error) async {
        if (storage) {
          await isar.writeTxn((isar) async {
            msgModel.sendStatus = SendStatus.failed;
            await msgModels().put(msgModel);
          });
        }
        if (onError != null) onError();
      },
    );
  }

  /// 更新消息
  void updateMsg({
    required MsgModel msgModel,
    Function()? onSuccess,
    Function()? onError,
  }) {
    IMLiteCore.instance.sendMsg(
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
        ),
      ),
      onSuccess: (data) async {
        if (onSuccess != null) onSuccess();
      },
      onError: (error) async {
        if (onError != null) onError();
      },
    );
  }
}
