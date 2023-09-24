import 'package:freezed_annotation/freezed_annotation.dart';

part 'sound_online_item.freezed.dart';
part 'sound_online_item.g.dart';

@freezed
class SoundOnlineItem with _$SoundOnlineItem {
  const factory SoundOnlineItem({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    required String name,
    required String image,
    required String source,
    @JsonKey(name: 'sound_type') required String soundType,
    required String category,
  }) = _SoundOnlineItem;

  factory SoundOnlineItem.fromJson(Map<String, dynamic> json) =>
      _$SoundOnlineItemFromJson(json);
}
