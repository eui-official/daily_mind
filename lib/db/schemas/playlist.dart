import 'package:isar/isar.dart';

part 'playlist.g.dart';

@collection
class Playlist {
  Id id = Isar.autoIncrement;

  String? title;

  List<MixItemInfo>? items;
}

@embedded
class MixItemInfo {
  late String id;

  late double volume;
}
