import 'package:isar/isar.dart';

part 'first_time.g.dart';

@collection
class FirstTime {
  Id id = Isar.autoIncrement;

  String? task;
}
