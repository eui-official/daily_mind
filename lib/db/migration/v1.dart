import 'package:daily_mind/db/schemas/mix_collection.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:isar/isar.dart';

void migrationV1(Isar isar) {
  final playlists = isar.playlists.filter().itemsIsNull().findAllSync();

  isar.writeTxnSync(() {
    isar.playlists
        .deleteAllSync(playlists.map((playlist) => playlist.id).toList());
  });
}

void migrationV2(Isar isar) {
  // Get all mix collections
  final recentMixCollections = isar.mixCollections.where().findAllSync();

  if (recentMixCollections.isNotEmpty) return;

  // Get all playlist
  final playlists = isar.playlists.where().findAllSync();

  // Convert to mix collections
  final mixCollections = playlists.map((playlist) {
    final items = playlist.items?.toList().map((item) {
      final info = MixCollectionItemInfo()
        ..id = item.id
        ..volume = item.volume;
      return info;
    }).toList();

    return MixCollection()
      ..title = playlist.title
      ..items = items;
  }).toList();

  // Add to db
  isar.writeTxnSync(() {
    isar.mixCollections.putAllSync(mixCollections);
  });
}
