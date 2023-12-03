import 'package:isar/isar.dart';

part 'online_playlist.g.dart';

@collection
class OnlinePlaylist {
  Id id = Isar.autoIncrement;

  String? title;

  List<String> itemIds = [];
}
