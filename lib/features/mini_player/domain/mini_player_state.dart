import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mini_player_state.freezed.dart';

@freezed
class MiniPlayerState with _$MiniPlayerState {
  const factory MiniPlayerState({
    required bool isShow,
    required String title,
    required VoidCallback onPressed,
  }) = _MiniPlayerState;
}
