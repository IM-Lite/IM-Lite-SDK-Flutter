import 'package:im_lite_sdk_flutter/src/model/msg_model.dart';
import 'package:isar/isar.dart';

class OfflinePushConverter extends TypeConverter<OfflinePushModel, String> {
  const OfflinePushConverter();

  @override
  OfflinePushModel fromIsar(String object) {
    return OfflinePushModel.fromJson(object);
  }

  @override
  String toIsar(OfflinePushModel object) {
    return object.toJson();
  }
}

class MsgOptionsConverter extends TypeConverter<MsgOptionsModel, String> {
  const MsgOptionsConverter();

  @override
  MsgOptionsModel fromIsar(String object) {
    return MsgOptionsModel.fromJson(object);
  }

  @override
  String toIsar(MsgOptionsModel object) {
    return object.toJson();
  }
}
