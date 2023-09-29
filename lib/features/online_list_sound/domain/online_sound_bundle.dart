import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/common_domains/sound_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_sound_bundle.freezed.dart';

@freezed
class OnlineSoundBundle with _$OnlineSoundBundle {
  const factory OnlineSoundBundle({
    required SoundType soundType,
    required List<SoundOnlineItem> sounds,
  }) = _OnlineSoundxBundle;
}
