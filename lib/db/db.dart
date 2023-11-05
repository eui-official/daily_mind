import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/db/schemas/first_time.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:daily_mind/features/offline_mix_editor/domain/offline_mix_editor_item_state.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Db {
  late Isar isar;

  Future<void> onInit() async {
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

  Stream<List<Playlist>> onStreamAllPlaylists() {
    return isar.playlists.where(sort: Sort.desc).anyId().watch();
  }

  Stream<Playlist?> onStreamPlaylistById(int id) {
    return isar.playlists.watchObject(id, fireImmediately: true);
  }

  Playlist? onGetPlaylistById(int id) {
    return isar.playlists.getSync(id);
  }

  List<Playlist> onGetAllPlaylists() {
    return isar.playlists.where(sort: Sort.desc).anyId().findAllSync();
  }

  void onAddSetting(String? value, String type) {
    final setting = isar.settings.filter().typeEqualTo(type).findFirstSync();

    isar.writeTxnSync(() {
      onSafeValueBuilder(
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

  Settings? onGetSetting(String type) {
    return isar.settings.filter().typeEqualTo(type).findFirstSync();
  }

  Stream<List<Settings>> onStreamSetting(String type,
      [bool fireImmediately = true]) {
    return isar.settings
        .filter()
        .typeEqualTo(type)
        .watch(fireImmediately: fireImmediately);
  }

  bool onIsFirstTime(String task) {
    return isar.firstTimes.filter().taskEqualTo(task).isEmptySync();
  }

  FirstTime? onGetFirstTime(String task) {
    final firstTime =
        isar.firstTimes.filter().taskEqualTo(task).findFirstSync();

    return firstTime;
  }

  void onAddFirstTime(String task) {
    final firstTime = onGetFirstTime(task);

    onSafeValueBuilder(firstTime, (safeFirstTime) {
      isar.firstTimes.putSync(safeFirstTime);
    }, () {
      isar.writeTxnSync(() {
        final newFirstTime = FirstTime()..task = task;
        isar.firstTimes.putSync(newFirstTime);
      });
    });
  }

  void onDeletePlaylist(int id) {
    isar.writeTxnSync(() {
      isar.playlists.deleteSync(id);
    });
  }

  void onUpdatePlaylistTitle(String title, int playlistId) {
    final playlist =
        isar.playlists.where().idEqualTo(playlistId).findFirstSync();

    onSafeValueBuilder(playlist, (safePlaylist) {
      safePlaylist.title = title;

      isar.writeTxnSync(() {
        isar.playlists.putSync(safePlaylist);
      });
    });
  }

  void onUpdateVolume(
    double volume,
    String itemId,
    int playlistId,
  ) {
    final playlist =
        isar.playlists.where().idEqualTo(playlistId).findFirstSync();

    onSafeValueBuilder(
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
