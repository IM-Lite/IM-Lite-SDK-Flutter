import 'package:im_lite_sdk_flutter/src/model/conv_model.dart';
import 'package:im_lite_sdk_flutter/src/model/msg_model.dart';
import 'package:isar/isar.dart';

class MsgConverter extends TypeConverter<MsgModel?, String> {
  const MsgConverter();

  @override
  MsgModel? fromIsar(String object) {
    return object.isNotEmpty ? MsgModel.fromJson(object) : null;
  }

  @override
  String toIsar(MsgModel? object) {
    return object?.toJson() ?? "";
  }
}

class DraftConverter extends TypeConverter<DraftModel?, String> {
  const DraftConverter();

  @override
  DraftModel? fromIsar(String object) {
    return object.isNotEmpty ? DraftModel.fromJson(object) : null;
  }

  @override
  String toIsar(DraftModel? object) {
    return object?.toJson() ?? "";
  }
}
