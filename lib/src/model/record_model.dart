import 'package:isar/isar.dart';

part 'record_model.g.dart';

@Collection()
class RecordModel {
  @Id()
  int? id;

  @Index()
  String senderID;
  @Index()
  String convID;
  int seq;

  RecordModel({
    required this.senderID,
    required this.convID,
    required this.seq,
  });
}
