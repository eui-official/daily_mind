import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_player_item.freezed.dart';

@freezed
class OfflinePlayerItem with _$OfflinePlayerItem {
  const factory OfflinePlayerItem({
    required GaplessAudioPlayer player,
    required String id,
  }) = _OfflinePlayerItem;
}
