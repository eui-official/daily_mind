import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_sound_online_items.freezed.dart';
part 'list_sound_online_items.g.dart';

@freezed
class ListSoundOnlineItems with _$ListSoundOnlineItems {
  const factory ListSoundOnlineItems({
    required List<SoundOnlineItem> soundOnlineItems,
  }) = _ListSoundOnlineItems;

  factory ListSoundOnlineItems.fromJson(Map<String, dynamic> json) =>
      _$ListSoundOnlineItemsFromJson(json);
}
