import 'dart:convert';
import 'package:im_lite_core_flutter/im_lite_core_flutter.dart';
import 'package:im_lite_sdk_flutter/src/constant/send_status.dart';
import 'package:im_lite_sdk_flutter/src/model/converter/msg_converter.dart';
import 'package:im_lite_sdk_flutter/src/tool/sdk_tool.dart';
import 'package:isar/isar.dart';

part 'msg_model.g.dart';

@Collection()
class MsgModel {
  @Id()
  int? id;

  @Index()
  String clientMsgID;
  String? serverMsgID;
  @Index()
  String senderID;
  @Index()
  String convID;
  @Index()
  int contentType;
  @Index()
  String content;
  int clientTime;
  int serverTime;
  int? seq;
  @OfflinePushConverter()
  OfflinePushModel offlinePush;
  @MsgOptionsConverter()
  MsgOptionsModel msgOptions;
  int sendStatus;

  MsgModel({
    required this.clientMsgID,
    this.serverMsgID,
    required this.senderID,
    required this.convID,
    required this.contentType,
    required this.content,
    required this.clientTime,
    required this.serverTime,
    this.seq,
    required this.offlinePush,
    required this.msgOptions,
    this.sendStatus = SendStatus.sending,
  });

  static MsgModel fromProtobuf(MsgData msg) {
    return MsgModel(
      clientMsgID: msg.clientMsgID,
      serverMsgID: msg.serverMsgID,
      senderID: msg.senderID,
      convID: msg.convID,
      contentType: msg.contentType,
      content: SDKTool.decode(msg.content),
      clientTime: msg.clientTime.toInt(),
      serverTime: msg.serverTime.toInt(),
      seq: msg.seq,
      offlinePush: OfflinePushModel.fromProtobuf(msg.offlinePush),
      msgOptions: MsgOptionsModel.fromProtobuf(msg.msgOptions),
    );
  }

  static MsgModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return MsgModel(
      clientMsgID: map["clientMsgID"],
      serverMsgID: map["serverMsgID"],
      senderID: map["senderID"],
      convID: map["convID"],
      contentType: map["contentType"],
      content: SDKTool.decode(map["content"]),
      clientTime: map["clientTime"],
      serverTime: map["serverTime"],
      seq: map["seq"],
      offlinePush: OfflinePushModel.fromJson(map["offlinePush"]),
      msgOptions: MsgOptionsModel.fromJson(map["msgOptions"]),
      sendStatus: map["sendStatus"],
    );
  }

  String toJson() {
    return json.encode({
      "clientMsgID": clientMsgID,
      "serverMsgID": serverMsgID,
      "senderID": senderID,
      "convID": convID,
      "contentType": contentType,
      "content": content,
      "clientTime": clientTime,
      "serverTime": serverTime,
      "seq": seq,
      "offlinePush": offlinePush.toJson(),
      "msgOptions": msgOptions.toJson(),
      "sendStatus": sendStatus,
    });
  }
}

class OfflinePushModel {
  String title;
  String desc;
  String ex;
  String iOSPushSound;
  bool iOSBadgeCount;
  List<String> userIDs;

  OfflinePushModel({
    required this.title,
    required this.desc,
    required this.ex,
    required this.iOSPushSound,
    required this.iOSBadgeCount,
    required this.userIDs,
  });

  static OfflinePushModel fromProtobuf(OfflinePush offlinePush) {
    return OfflinePushModel(
      title: offlinePush.title,
      desc: offlinePush.desc,
      ex: offlinePush.ex,
      iOSPushSound: offlinePush.iOSPushSound,
      iOSBadgeCount: offlinePush.iOSBadgeCount,
      userIDs: offlinePush.userIDs,
    );
  }

  static OfflinePushModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return OfflinePushModel(
      title: map["title"],
      desc: map["desc"],
      ex: map["ex"],
      iOSPushSound: map["iOSPushSound"],
      iOSBadgeCount: map["iOSBadgeCount"],
      userIDs: map["userIDs"],
    );
  }

  String toJson() {
    return json.encode({
      "title": title,
      "desc": desc,
      "ex": ex,
      "iOSPushSound": iOSPushSound,
      "iOSBadgeCount": iOSBadgeCount,
      "userIDs": userIDs,
    });
  }
}

class MsgOptionsModel {
  bool storage;
  bool unread;

  MsgOptionsModel({
    required this.storage,
    required this.unread,
  });

  static MsgOptionsModel fromProtobuf(MsgOptions msgOptions) {
    return MsgOptionsModel(
      storage: msgOptions.storage,
      unread: msgOptions.unread,
    );
  }

  static MsgOptionsModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return MsgOptionsModel(
      storage: map["storage"],
      unread: map["unread"],
    );
  }

  String toJson() {
    return json.encode({
      "storage": storage,
      "unread": unread,
    });
  }
}
