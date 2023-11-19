import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/migration/v1.dart';
import 'package:daily_mind/db/schemas/first_time.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Db {
  late Isar isar;

  Future<void> onInit() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        FirstTimeSchema,
        PlaylistSchema,
        SettingsSchema,
        TaskSchema,
      ],
      directory: dir.path,
    );

    await performMigrationIfNeeded(isar);
  }

  Future<void> performMigrationIfNeeded(Isar isar) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('dbVersion');

    final currentVersion = prefs.getInt('dbVersion') ?? 1;

    switch (currentVersion) {
      case 1:
        migrationV1(isar);
        break;
      case 2:
        return;
      default:
        throw Exception('Unknown version: $currentVersion');
    }

    await prefs.setInt('dbVersion', 2);
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

  Future<int> onAddNewPlaylist(Playlist playlist) {
    return isar.writeTxn(() {
      return isar.playlists.put(playlist);
    });
  }

  Stream<List<Playlist>> onStreamMixToState() {
    final playlist = isar.playlists.where().watch();

    return playlist;
  }

  Stream<List<Task>> onStreamTasks() {
    return isar.tasks.where(sort: Sort.desc).anyId().watch();
  }

  List<Task> onGetTasks() {
    return isar.tasks.where(sort: Sort.desc).anyId().findAllSync();
  }

  void onAddANewTask(Task task) {
    isar.writeTxnSync(() {
      isar.tasks.putSync(task);
    });
  }

  void onUpdateTask(Task task) {
    isar.writeTxnSync(() {
      isar.tasks.putSync(task);
    });
  }

  void onDeleteTask(int id) {
    isar.writeTxnSync(() {
      isar.tasks.deleteSync(id);
    });
  }

  void onUpdateAudioId(Task task, String audioId, String audioFrom) {
    task.audioId = audioId;
    task.audioFrom = audioFrom;

    isar.writeTxnSync(() {
      isar.tasks.putSync(task);
    });
  }

  void onDeleteAudioId(Task task) {
    task.audioId = emptyNull;
    task.audioFrom = emptyNull;

    isar.writeTxnSync(() {
      isar.tasks.putSync(task);
    });
  }

  Stream<Task?> onStreamTask(int id) {
    return isar.tasks.watchObject(id);
  }
}

final db = Db();
