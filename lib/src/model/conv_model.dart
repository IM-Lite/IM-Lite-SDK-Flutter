import 'dart:convert';
import 'package:im_lite_core_flutter/im_lite_core_flutter.dart';
import 'package:im_lite_sdk_flutter/src/model/converter/conv_converter.dart';
import 'package:im_lite_sdk_flutter/src/model/msg_model.dart';
import 'package:isar/isar.dart';

part 'conv_model.g.dart';

@Collection()
class ConvModel {
  @Id()
  int? id;

  @Index()
  String convID;
  int maxSeq;
  int minSeq;
  @MsgConverter()
  MsgModel? msgModel;
  int msgTime;
  int unreadCount;
  @DraftConverter()
  DraftModel? draftModel;
  bool isPinned;

  ConvModel({
    required this.convID,
    required this.maxSeq,
    required this.minSeq,
    this.msgModel,
    this.msgTime = 0,
    this.unreadCount = 0,
    this.draftModel,
    this.isPinned = false,
  });

  static ConvModel fromProtobuf(ConvData conv) {
    return ConvModel(
      convID: conv.convID,
      maxSeq: conv.maxSeq,
      minSeq: conv.minSeq,
    );
  }
}

class DraftModel {
  String content;
  int time;

  DraftModel({
    required this.content,
    required this.time,
  });

  static DraftModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return DraftModel(
      content: map["content"],
      time: map["time"],
    );
  }

  String toJson() {
    return json.encode({
      "content": content,
      "time": time,
    });
  }
}
