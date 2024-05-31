import 'package:isar/isar.dart';

part 'alarm_history.g.dart';

@collection
class AlarmHistory {
  Id id = Isar.autoIncrement;

  DateTime? endTime;

  String? audioId;
}
