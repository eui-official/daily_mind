import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_player_state.freezed.dart';

@freezed
class OnlinePlayerState with _$OnlinePlayerState {
  const OnlinePlayerState._();

  const factory OnlinePlayerState({
    required bool isExpanded,
    required dynamic id,
    String? title,
    String? description,
  }) = _OnlinePlayerState;

  bool get isNotExpanded => !isExpanded;
}
