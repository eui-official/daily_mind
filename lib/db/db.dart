import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/db/migration/v1.dart';
import 'package:daily_mind/db/schemas/first_time.dart';
import 'package:daily_mind/db/schemas/mix_collection.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
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
        MixCollectionSchema,
        SettingsSchema,
        OnlinePlaylistSchema,
      ],
      directory: dir.path,
    );

    await performMigrationIfNeeded(isar);
  }

  Future<void> performMigrationIfNeeded(Isar isar) async {
    final prefs = await SharedPreferences.getInstance();

    final currentVersion = prefs.getInt('dbVersion') ?? 1;

    switch (currentVersion) {
      case 1:
        migrationV1(isar);
        break;
      case 2:
        migrationV2(isar);
        return;
      default:
        throw Exception('Unknown version: $currentVersion');
    }

    await prefs.setInt('dbVersion', 2);
  }

  Stream<List<MixCollection>> onStreamAllMixCollections() {
    return isar.mixCollections.where(sort: Sort.desc).anyId().watch();
  }

  Stream<MixCollection?> onStreamMixCollectionById(int id) {
    return isar.mixCollections.watchObject(id, fireImmediately: true);
  }

  MixCollection? onGetMixCollectionById(int id) {
    return isar.mixCollections.getSync(id);
  }

  List<MixCollection> onGetAllMixCollections() {
    return isar.mixCollections.where(sort: Sort.desc).anyId().findAllSync();
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

  void onDeleteCollection(int id) {
    isar.writeTxnSync(() {
      isar.mixCollections.deleteSync(id);
    });
  }

  void onUpdateCollectionTitle(String title, int mixCollectionId) {
    final mixCollection =
        isar.mixCollections.where().idEqualTo(mixCollectionId).findFirstSync();

    onSafeValueBuilder(mixCollection, (safeMixCollection) {
      safeMixCollection.title = title;

      isar.writeTxnSync(() {
        isar.mixCollections.putSync(safeMixCollection);
      });
    });
  }

  Future<int> onAddNewMixCollection(MixCollection mixCollection) {
    return isar.writeTxn(() {
      return isar.mixCollections.put(mixCollection);
    });
  }

  Stream<List<MixCollection>> onStreamMixCollectionsToState() {
    final mixCollections = isar.mixCollections.where().watch();

    return mixCollections;
  }

  void onAddOnlinePlaylist(OnlinePlaylist onlinePlaylist) {
    isar.writeTxnSync(() {
      isar.onlinePlaylists.putSync(onlinePlaylist);
    });
  }

  void onAddAudioToPlaylist(String audioId, int onlinePlaylistId) {
    final onlinePlaylist = isar.onlinePlaylists
        .where()
        .idEqualTo(onlinePlaylistId)
        .findFirstSync();

    // Check if the audioId is alerady in the playlist
    if (onlinePlaylist?.itemIds.contains(audioId) ?? false) {
      return;
    }

    onSafeValueBuilder(onlinePlaylist, (safeOnlinePlaylist) {
      safeOnlinePlaylist.itemIds = [...safeOnlinePlaylist.itemIds, audioId];

      isar.writeTxnSync(() {
        isar.onlinePlaylists.putSync(safeOnlinePlaylist);
      });
    });
  }

  List<OnlinePlaylist> onGetOnlinePlaylists() {
    return isar.onlinePlaylists.where().findAllSync();
  }

  Stream<List<OnlinePlaylist>> onStreamOnlinePlaylists() {
    return isar.onlinePlaylists.where().watch();
  }

  OnlinePlaylist? onGetOnlinePlaylist(int id) {
    return isar.onlinePlaylists.getSync(id);
  }

  void onDeleteOnlinePlaylist(int id) {
    isar.writeTxnSync(() {
      isar.onlinePlaylists.deleteSync(id);
    });
  }
}

final db = Db();
