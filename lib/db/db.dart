import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/mix_editor/domain/mix_editor_item_state.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Db {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        PlaylistSchema,
      ],
      directory: dir.path,
    );
  }

  Stream<List<Playlist>> getAllPlaylists() {
    return isar.playlists.where().findAll().asStream();
  }

  Playlist? getPlaylistById(int id) {
    return isar.playlists.where().idEqualTo(id).findFirstSync();
  }

  void addANewMix(List<MixEditorItemState> itemStates) {
    final items = itemStates.map((item) {
      return PlaylistItem()
        ..id = item.id
        ..volume = item.volume;
    }).toList();

    Playlist playlist = Playlist()..items = items;

    isar.writeTxnSync(() {
      isar.playlists.putSync(playlist);
    });
  }
}

final db = Db();
