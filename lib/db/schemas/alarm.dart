import 'package:isar/isar.dart';

part 'alarm.g.dart';

@collection
class Alarm {
  Id id = Isar.autoIncrement;

  DateTime? endTime;

  String? audioId;
}
