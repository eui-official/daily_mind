import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mix_item.freezed.dart';

@freezed
class MixItem with _$MixItem {
  const factory MixItem({
    required GaplessAudioPlayer player,
    required AudioOffline audio,
  }) = _MixItem;
}
