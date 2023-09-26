import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/common_domains/sound_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sound_online_bundle.freezed.dart';

@freezed
class SoundOnlineBundle with _$SoundOnlineBundle {
  const factory SoundOnlineBundle({
    required SoundType soundType,
    required List<SoundOnlineItem> sounds,
  }) = _SoundOnlineBundle;
}
