import 'package:daily_mind/features/play_mix/domain/player_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_mix_state.freezed.dart';

@freezed
class PlayMixState with _$PlayMixState {
  const factory PlayMixState({
    required bool isPlaying,
    required List<PlayerItem> playerItems,
  }) = _PlayMixState;
}
