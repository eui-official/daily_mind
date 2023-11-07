import 'package:isar/isar.dart';

part 'pomodoro.g.dart';

@collection
class Pomodoro {
  Id id = Isar.autoIncrement;

  String? title;

  String? iconId;

  int? workingSessions;

  int? shortBreak;

  int? longBreak;

  String? audioId;
}
