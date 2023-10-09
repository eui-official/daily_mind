import 'package:daily_mind/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'mini_player_state.freezed.dart';

@freezed
class MiniPlayerState with _$MiniPlayerState {
  const factory MiniPlayerState({
    required bool isShow,
    required Widget image,
    required String title,
    required VoidCallback onPressed,
    required NetworkType networkType,
    @Default(Stream.empty()) Stream<ProcessingState> processingStateStream,
  }) = _MiniPlayerState;
}
