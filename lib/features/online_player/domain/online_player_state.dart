import 'package:daily_mind/features/online_player/domain/online_player_open_from_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_player_state.freezed.dart';

@freezed
class OnlinePlayerState with _$OnlinePlayerState {
  const factory OnlinePlayerState({
    required bool isExpanded,
    required OnlinePlayerOpenFromState openFrom,
  }) = _OnlinePlayerState;
}
