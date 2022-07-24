import 'package:im_lite_sdk_flutter/src/model/msg_model.dart';

/// 消息监听
class MsgListener {
  final Function(MsgModel msgModel)? onReceive; // 接收消息

  MsgListener({
    this.onReceive,
  });

  void receive(MsgModel msgModel) {
    if (onReceive != null) onReceive!(msgModel);
  }
}
