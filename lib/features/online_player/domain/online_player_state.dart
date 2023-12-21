import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_player_state.freezed.dart';

@freezed
class OnlinePlayerState with _$OnlinePlayerState {
  const factory OnlinePlayerState({
    required bool isExpanded,
    required String name,
  }) = _OnlinePlayerState;
}
