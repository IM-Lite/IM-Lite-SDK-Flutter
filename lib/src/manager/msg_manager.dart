import 'package:im_lite_sdk_flutter/src/constant/content_type.dart';
import 'package:im_lite_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:im_lite_sdk_flutter/src/model/msg_model.dart';
import 'package:im_lite_sdk_flutter/src/model/sdk_content.dart';
import 'package:isar/isar.dart';

class MsgManager {
  final SDKManager _sdkManager;

  MsgManager(this._sdkManager);

  /// 获取列表
  Future<List<MsgModel>> getMsgList({
    required String convID,
    int? offset,
    int? limit,
  }) async {
    return await getCustomList(
      filter: FilterGroup.and([
        FilterCondition(
          type: ConditionType.eq,
          property: "convID",
          value: convID,
        ),
      ]),
      sortBy: [
        const SortProperty(
          property: "serverTime",
          sort: Sort.desc,
        ),
      ],
      offset: offset,
      limit: limit,
    );
  }

  /// 获取自定义列表
  Future<List<MsgModel>> getCustomList({
    List<WhereClause> whereClauses = const [],
    bool whereDistinct = false,
    Sort whereSort = Sort.asc,
    FilterOperation? filter,
    List<SortProperty> sortBy = const [],
    List<DistinctProperty> distinctBy = const [],
    int? offset,
    int? limit,
    String? property,
  }) async {
    return await _sdkManager
        .msgModels()
        .buildQuery<MsgModel>(
          whereClauses: whereClauses,
          whereDistinct: whereDistinct,
          whereSort: whereSort,
          filter: filter,
          sortBy: sortBy,
          distinctBy: distinctBy,
          offset: offset,
          limit: limit,
          property: property,
        )
        .findAll();
  }

  /// 发送正在输入
  void sendTyping({
    required String convID,
    required TypingContent content,
    Function()? onSuccess,
    Function()? onError,
  }) {
    MsgModel msgModel = _sdkManager.createMsg(
      convID: convID,
      contentType: ContentType.typing,
      content: content.toJson(),
      offlinePush: OfflinePushModel(
        title: "",
        desc: "",
        ex: "",
        iOSPushSound: "",
        iOSBadgeCount: false,
        userIDs: [],
      ),
      msgOptions: MsgOptionsModel(
        storage: false,
        unread: false,
      ),
    );
    sendMsg(
      msgModel: msgModel,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  /// 发送已读消息
  void sendRead({
    required String convID,
    required ReadContent content,
    Function()? onSuccess,
    Function()? onError,
  }) {
    MsgModel msgModel = _sdkManager.createMsg(
      convID: convID,
      contentType: ContentType.read,
      content: content.toJson(),
      offlinePush: OfflinePushModel(
        title: "",
        desc: "",
        ex: "",
        iOSPushSound: "",
        iOSBadgeCount: false,
        userIDs: [],
      ),
      msgOptions: MsgOptionsModel(
        storage: false,
        unread: false,
      ),
    );
    sendMsg(
      msgModel: msgModel,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  /// 发送撤回消息
  void sendRevoke({
    required String clientMsgID,
    required String convID,
    required RevokeContent content,
    Function()? onSuccess,
    Function()? onError,
  }) {
    MsgModel msgModel = _sdkManager.createMsg(
      clientMsgID: clientMsgID,
      convID: convID,
      contentType: ContentType.revoke,
      content: content.toJson(),
      offlinePush: OfflinePushModel(
        title: "",
        desc: "",
        ex: "",
        iOSPushSound: "",
        iOSBadgeCount: false,
        userIDs: [],
      ),
      msgOptions: MsgOptionsModel(
        storage: true,
        unread: false,
      ),
    );
    sendMsg(
      msgModel: msgModel,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  /// 创建文本消息
  MsgModel createText({
    required String convID,
    required String text,
    required OfflinePushModel offlinePush,
  }) {
    return _sdkManager.createMsg(
      convID: convID,
      contentType: ContentType.text,
      content: text,
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        storage: true,
        unread: true,
      ),
    );
  }

  /// 创建图片消息
  MsgModel createPicture({
    required String convID,
    required PictureContent content,
    required OfflinePushModel offlinePush,
  }) {
    return _sdkManager.createMsg(
      convID: convID,
      contentType: ContentType.picture,
      content: content.toJson(),
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        storage: true,
        unread: true,
      ),
    );
  }

  /// 创建语音消息
  MsgModel createVoice({
    required String convID,
    required VoiceContent content,
    required OfflinePushModel offlinePush,
  }) {
    return _sdkManager.createMsg(
      convID: convID,
      contentType: ContentType.voice,
      content: content.toJson(),
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        storage: true,
        unread: true,
      ),
    );
  }

  /// 创建视频消息
  MsgModel createVideo({
    required String convID,
    required VideoContent content,
    required OfflinePushModel offlinePush,
  }) {
    return _sdkManager.createMsg(
      convID: convID,
      contentType: ContentType.video,
      content: content.toJson(),
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        storage: true,
        unread: true,
      ),
    );
  }

  /// 创建文件消息
  MsgModel createFile({
    required String convID,
    required FileContent content,
    required OfflinePushModel offlinePush,
  }) {
    return _sdkManager.createMsg(
      convID: convID,
      contentType: ContentType.file,
      content: content.toJson(),
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        storage: true,
        unread: true,
      ),
    );
  }

  /// 创建自定义消息
  MsgModel createCustom({
    required String convID,
    required int contentType,
    required String content,
    required OfflinePushModel offlinePush,
    required MsgOptionsModel msgOptions,
  }) {
    assert(contentType > ContentType.file);
    return _sdkManager.createMsg(
      convID: convID,
      contentType: contentType,
      content: content,
      offlinePush: offlinePush,
      msgOptions: msgOptions,
    );
  }

  /// 发送消息
  void sendMsg({
    required MsgModel msgModel,
    Function()? onSuccess,
    Function()? onError,
  }) {
    _sdkManager.sendMsg(
      msgModel: msgModel,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  /// 删除消息
  Future<bool> deleteMsg({
    required String convID,
    required String clientMsgID,
  }) async {
    MsgModel? msgModel = await _sdkManager
        .msgModels()
        .filter()
        .convIDEqualTo(convID)
        .and()
        .clientMsgIDEqualTo(clientMsgID)
        .findFirst();
    if (msgModel != null) {
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.msgModels().delete(msgModel.id!);
      });
      return true;
    }
    return false;
  }

  /// 清空本地消息
  Future<bool> clearMsg({
    required String convID,
  }) async {
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager
          .msgModels()
          .filter()
          .convIDEqualTo(
            convID,
          )
          .deleteAll();
    });
    return true;
  }
}
