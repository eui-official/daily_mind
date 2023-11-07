import 'package:isar/isar.dart';

part 'pomodoro.g.dart';

@collection
class Pomodoro {
  Id id = Isar.autoIncrement;

  int? longBreak;

  int? shortBreak;

  int? workingSessions;

  String? audioId;

  String? iconId;

  String? title;
}
