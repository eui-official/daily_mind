import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/db/schemas/settings.dart';
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
        SettingsSchema,
      ],
      directory: dir.path,
    );
  }

  Stream<List<Playlist>> streamAllPlaylists() {
    return isar.playlists.where().watch();
  }

  Stream<Playlist?> streamPlaylistById(int id) {
    return isar.playlists.watchObject(id, fireImmediately: true);
  }

  Playlist? getPlaylistById(int id) {
    return isar.playlists.getSync(id);
  }

  List<Playlist> getAllPlaylists() {
    return isar.playlists.where().findAllSync();
  }

  Settings? getTheme() {
    return isar.settings.filter().typeEqualTo("theme").findFirstSync();
  }

  Stream<List<Settings>> streamTheme() {
    return isar.settings.filter().typeEqualTo("theme").watch();
  }

  void addTheme(String value) {
    final themeSetting =
        isar.settings.filter().typeEqualTo("theme").findFirstSync();

    isar.writeTxnSync(() {
      safeValueBuilder(
        themeSetting,
        (safeThemeSetting) {
          safeThemeSetting.value = value;
          isar.settings.putSync(safeThemeSetting);
        },
        () {
          final newThemeSetting = Settings()
            ..type = "theme"
            ..value = value;

          isar.settings.putSync(newThemeSetting);
        },
      );
    });
  }

  void deletePlaylist(int id) {
    isar.writeTxnSync(() {
      isar.playlists.deleteSync(id);
    });
  }

  void onUpdatePlaylistTitle(int playlistId, String title) {
    final playlist =
        isar.playlists.where().idEqualTo(playlistId).findFirstSync();

    safeValueBuilder(playlist, (safePlaylist) {
      safePlaylist.title = title;

      isar.writeTxnSync(() {
        isar.playlists.putSync(safePlaylist);
      });
    });
  }

  void updateVolume(
    double volume,
    String itemId,
    int playlistId,
  ) {
    final playlist =
        isar.playlists.where().idEqualTo(playlistId).findFirstSync();

    safeValueBuilder(
      playlist,
      (safePlaylist) {
        final items = safePlaylist.items ?? [];
        final index = items.indexWhere((item) => item.id == itemId);
        final item = items[index];

        item.volume = volume;

        items[index] = item;

        safePlaylist.items = items;

        isar.writeTxnSync(() {
          isar.playlists.putSync(safePlaylist);
        });
      },
    );
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
