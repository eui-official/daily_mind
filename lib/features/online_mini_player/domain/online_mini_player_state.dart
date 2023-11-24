import 'package:daily_mind/common_domains/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_mini_player_state.freezed.dart';

@freezed
class OnlineMiniPlayerState with _$OnlineMiniPlayerState {
  const factory OnlineMiniPlayerState({
    Category? category,
  }) = _OnlineMiniPlayerState;
}
