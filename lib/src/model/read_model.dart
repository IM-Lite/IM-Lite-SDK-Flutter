import 'package:isar/isar.dart';

part 'read_model.g.dart';

@Collection()
class ReadModel {
  @Id()
  int? id;

  @Index()
  String senderID;
  @Index()
  String convID;
  int seq;

  ReadModel({
    required this.senderID,
    required this.convID,
    required this.seq,
  });
}
