import 'package:isar/isar.dart';

part 'playlist.g.dart';

@collection
class Playlist {
  Id id = Isar.autoIncrement;

  String? title;

  List<PlaylistItem>? items;
}

@embedded
class PlaylistItem {
  late String id;

  late double volume;
}
