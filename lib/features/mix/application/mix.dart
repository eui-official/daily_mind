import 'package:collection/collection.dart';
import 'package:daily_mind/db/schemas/playlist.dart';

bool onComplareMix(
  String title,
  Playlist playlist,
  Playlist? recentPlaylist,
) {
  final currentItems = playlist.items ?? [];
  final recentItems = recentPlaylist?.items ?? [];
  final hasItems = currentItems.map((item) {
    final recentItem = recentItems.firstWhereOrNull((recentItem) {
      return recentItem.id == item.id;
    });

    return recentItem?.volume != item.volume;
  });

  return hasItems.contains(true) || title != recentPlaylist?.title;
}
