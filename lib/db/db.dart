import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/db/schemas/first_time.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:daily_mind/features/offline_mix_editor/domain/offline_mix_editor_item_state.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Db {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        FirstTimeSchema,
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

  void addSetting(String? value, String type) {
    final setting = isar.settings.filter().typeEqualTo(type).findFirstSync();

    isar.writeTxnSync(() {
      safeValueBuilder(
        setting,
        (safeSetting) {
          safeSetting.value = value;
          isar.settings.putSync(safeSetting);
        },
        () {
          final newSetting = Settings()
            ..type = type
            ..value = value;

          isar.settings.putSync(newSetting);
        },
      );
    });
  }

  Settings? getSetting(String type) {
    return isar.settings.filter().typeEqualTo(type).findFirstSync();
  }

  Stream<List<Settings>> streamSetting(String type,
      [bool fireImmediately = true]) {
    return isar.settings
        .filter()
        .typeEqualTo(type)
        .watch(fireImmediately: fireImmediately);
  }

  bool isFirstTime(String task) {
    return isar.firstTimes.filter().taskEqualTo(task).isEmptySync();
  }

  FirstTime? getFirstTime(String task) {
    final firstTime =
        isar.firstTimes.filter().taskEqualTo(task).findFirstSync();

    return firstTime;
  }

  void addFirstTime(String task) {
    final firstTime = getFirstTime(task);

    safeValueBuilder(firstTime, (safeFirstTime) {
      isar.firstTimes.putSync(safeFirstTime);
    }, () {
      isar.writeTxnSync(() {
        final newFirstTime = FirstTime()..task = task;
        isar.firstTimes.putSync(newFirstTime);
      });
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

  void onAddANewOfflineMix(List<OfflineMixEditorItemState> itemStates) {
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
