import 'package:im_lite_sdk_flutter/src/manager/msg_manager.dart';
import 'package:im_lite_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:im_lite_sdk_flutter/src/model/conv_model.dart';
import 'package:im_lite_sdk_flutter/src/model/sdk_content.dart';
import 'package:isar/isar.dart';

class ConvManager {
  final SDKManager _sdkManager;
  final MsgManager _msgManager;

  ConvManager(this._sdkManager, this._msgManager);

  /// 获取列表
  Future<List<ConvModel>> getConvList() {
    return getCustomConvList(
      sortBy: [
        const SortProperty(
          property: "isPinned",
          sort: Sort.desc,
        ),
        const SortProperty(
          property: "draftText",
          sort: Sort.desc,
        ),
        const SortProperty(
          property: "msgTime",
          sort: Sort.desc,
        ),
      ],
    );
  }

  /// 获取自定义列表
  Future<List<ConvModel>> getCustomConvList({
    List<WhereClause> whereClauses = const [],
    bool whereDistinct = false,
    Sort whereSort = Sort.asc,
    FilterOperation? filter,
    List<SortProperty> sortBy = const [],
    List<DistinctProperty> distinctBy = const [],
    int? offset,
    int? limit,
    String? property,
  }) {
    return _sdkManager
        .convModels()
        .buildQuery<ConvModel>(
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

  /// 设置草稿
  Future<bool> setConvDraft({
    required String convID,
    String? content,
  }) async {
    DraftModel? draftModel;
    if (content != null) {
      draftModel = DraftModel(
        content: content,
        time: DateTime.now().millisecondsSinceEpoch,
      );
    }
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIDEqualTo(convID)
        .findFirst();
    if (convModel != null) {
      convModel.draftModel = draftModel;
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.convModels().put(convModel);
      });
      return true;
    }
    return false;
  }

  /// 设置置顶
  Future<bool> setConvPinned({
    required String convID,
    required bool isPinned,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIDEqualTo(convID)
        .findFirst();
    if (convModel != null) {
      convModel.isPinned = isPinned;
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.convModels().put(convModel);
      });
      return true;
    }
    return false;
  }

  /// 设置已读
  Future<bool> setConvRead({
    required String convID,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIDEqualTo(convID)
        .findFirst();
    if (convModel != null) {
      convModel.unreadCount = 0;
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.convModels().put(convModel);
      });
      _msgManager.sendRead(
        convID: convID,
        content: ReadContent(seq: convModel.maxSeq),
      );
      return true;
    }
    return false;
  }

  /// 删除会话
  Future<bool> deleteConv({
    required String convID,
    bool clearMsg = true,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIDEqualTo(convID)
        .findFirst();
    if (convModel != null) {
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.convModels().delete(convModel.id!);
      });
      if (clearMsg) {
        await _msgManager.clearMsg(convID: convID);
      }
      return true;
    }
    return false;
  }

  /// 未读数量
  Future<int> getUnreadCount() {
    return _sdkManager.convModels().where().unreadCountProperty().sum();
  }
}
