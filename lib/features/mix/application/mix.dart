import 'package:collection/collection.dart';
import 'package:daily_mind/db/schemas/mix_collection.dart';

bool onComplareMix(
  String title,
  MixCollection mixCollection,
  MixCollection? recentMixCollection,
) {
  final currentItems = mixCollection.items ?? [];
  final recentItems = recentMixCollection?.items ?? [];
  final hasItems = currentItems.map((item) {
    final recentItem = recentItems.firstWhereOrNull((recentItem) {
      return recentItem.id == item.id;
    });

    return recentItem?.volume != item.volume;
  });

  return hasItems.contains(true) || title != recentMixCollection?.title;
}
