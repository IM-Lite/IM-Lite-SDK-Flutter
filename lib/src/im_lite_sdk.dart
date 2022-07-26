import 'package:im_lite_core_flutter/im_lite_core_flutter.dart';
import 'package:im_lite_sdk_flutter/src/listener/conv_listener.dart';
import 'package:im_lite_sdk_flutter/src/listener/msg_listener.dart';
import 'package:im_lite_sdk_flutter/src/listener/unread_count_listener.dart';
import 'package:im_lite_sdk_flutter/src/manager/conv_manager.dart';
import 'package:im_lite_sdk_flutter/src/manager/msg_manager.dart';
import 'package:im_lite_sdk_flutter/src/manager/sdk_manager.dart';

class IMLiteSDK {
  factory IMLiteSDK() => _getInstance();

  static IMLiteSDK get instance => _getInstance();
  static IMLiteSDK? _instance;

  static IMLiteSDK _getInstance() {
    return _instance ??= IMLiteSDK._internal();
  }

  IMLiteSDK._internal();

  SDKManager? _sdkManager;
  late ConvManager convManager;
  late MsgManager msgManager;

  /// 初始化
  void init({
    required String apiUrl,
    required String wsUrl,
    Duration autoPullTime = const Duration(seconds: 30),
    int pullMsgCount = 200,
    bool isarInspector = false,
    ConnectListener? connectListener,
    ConvListener? convListener,
    MsgListener? msgListener,
    UnreadCountListener? unreadCountListener,
  }) {
    _sdkManager = SDKManager(
      pullMsgCount: pullMsgCount,
      isarInspector: isarInspector,
      convListener: convListener,
      msgListener: msgListener,
      unreadCountListener: unreadCountListener,
    );
    msgManager = MsgManager(_sdkManager!);
    convManager = ConvManager(_sdkManager!, msgManager);
    IMLiteCore.instance.init(
      apiUrl: apiUrl,
      wsUrl: wsUrl,
      autoPullTime: autoPullTime,
      connectListener: connectListener,
      receiveConvListener: ReceiveConvListener(
        onPullConv: _sdkManager!.onPullConv,
      ),
      receiveMsgListener: ReceiveMsgListener(
        onPushMsg: _sdkManager!.onPushMsg,
      ),
    );
  }

  /// 登录
  Future login({
    required String token,
    required String userID,
  }) async {
    await _sdkManager?.openDatabase(userID: userID);
    await IMLiteCore.instance.login(
      token: token,
      userID: userID,
    );
  }

  /// 登出
  Future logout() async {
    await IMLiteCore.instance.logout();
    await _sdkManager?.closeDatabase();
  }
}
