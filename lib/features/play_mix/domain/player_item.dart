import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_item.freezed.dart';

@freezed
class PlayerItem with _$PlayerItem {
  const factory PlayerItem({
    required GaplessAudioPlayer player,
    required String id,
  }) = _PlayerItem;
}
