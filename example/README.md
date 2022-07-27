# IM-Lite-SDK-Flutter

[![Pub](https://img.shields.io/pub/v/im_lite_sdk_flutter.svg?style=flat-square)](https://pub.dev/packages/im_lite_sdk_flutter)

支持Flutter6端开发。实现会话和消息列表、草稿置顶、收发消息、已读撤回等功能。

使用参考：[Demo](https://github.com/IM-Lite/IM-Lite-SDK-Flutter-Demo)

连接数据库：[Isar Inspector](https://github.com/isar/isar/releases/latest)

它是空安全的，为什么没有空安全标识？

问题参考：[Flutter Issues](https://github.com/flutter/flutter/issues/44937)

问题参考：[Pana Issues](https://github.com/dart-lang/pana/issues/891)

放心使用，因为它：💪 Building with sound null safety 💪

## 初始化

     IMLiteSDK.instance.init(
       apiUrl: "",
       wsUrl: "",
       autoPullTime: const Duration(seconds: 30),
       pullMsgCount: 100,
       isarInspector: false,
       connectListener: ConnectListener(
         onConnecting: () {
           // 连接中
         },
         onSuccess: () {
           // 连接成功
         },
         onError: (error) {
           // 发生错误
         },
         onClose: () {
           // 连接关闭
         },
       ),
       convListener: ConvListener(
         onUpdate: () {
           // 更新会话
         },
       ),
       msgListener: MsgListener(
         onReceive: (msgModel) {
           // 接收消息
         },
       ),
       unreadCountListener: UnreadCountListener(
         onUnreadCount: (count) {
           // 未读数量
         },
       ),
     );

## 登录

     IMLiteSDK.instance.login(
       token: "",
       userID: "",
     );

## 登出

     IMLiteSDK.instance.logout();

## 会话管理

### 获取列表

     IMLiteSDK.instance.convManager.getConvList();

### 设置草稿

     IMLiteSDK.instance.convManager.setConvDraft(
       convID: "",
       content: "",
     );

### 设置置顶

     IMLiteSDK.instance.convManager.setConvPinned(
       convID: "",
       isPinned: true,
     );

### 设置已读

     IMLiteSDK.instance.convManager.setConvRead(
       convID: "",
     );

### 删除会话

     IMLiteSDK.instance.convManager.deleteConv(
       convID: "",
       clearMsg: true,
     );

### 未读数量

     IMLiteSDK.instance.convManager.getUnreadCount();

## 消息管理

### 获取列表

     IMLiteSDK.instance.msgManager.getMsgList(
       convID: "",
       offset: 0,
       limit: 20,
     );

### 获取云端列表

     IMLiteSDK.instance.msgManager.getCloudMsgList(
       convID: "",
       seq: 20,
       size: 20,
     );

### 发送正在输入

     IMLiteSDK.instance.msgManager.sendTyping(
       convID: "",
       content: TypingContent(focus: true),
     );

### 发送已读消息

     IMLiteSDK.instance.msgManager.sendRead(
       convID: "",
       content: ReadContent(seq: 20),
     );

### 发送撤回消息

     IMLiteSDK.instance.msgManager.sendRevoke(
       clientMsgID: "",
       convID: "",
       content: RevokeContent(content: ""),
     );

### 创建文本、图片、语音、视频、文件、自定义消息

     IMLiteSDK.instance.msgManager.createText(...);
     IMLiteSDK.instance.msgManager.createPicture(...);
     IMLiteSDK.instance.msgManager.createVoice(...);
     IMLiteSDK.instance.msgManager.createVideo(...);
     IMLiteSDK.instance.msgManager.createFile(...);
     IMLiteSDK.instance.msgManager.createCustom(...);

### 发送消息

     IMLiteSDK.instance.msgManager.sendMsg(
       msgModel: msgModel,
     );

### 删除消息

     IMLiteSDK.instance.msgManager.deleteMsg(
       convID: "",
       clientMsgID: "",
     );

### 清空消息

     IMLiteSDK.instance.msgManager.clearMsg(
       convID: "",
     );
