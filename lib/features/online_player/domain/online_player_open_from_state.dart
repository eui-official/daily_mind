import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_player_open_from_state.freezed.dart';

@freezed
class OnlinePlayerOpenFromState with _$OnlinePlayerOpenFromState {
  const factory OnlinePlayerOpenFromState({
    required String name,
  }) = _OnlinePlayerOpenFromState;
}
