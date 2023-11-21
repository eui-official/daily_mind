import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;

  int? longBreak;

  int? shortBreak;

  int? workingSessions;

  String? title;
}
