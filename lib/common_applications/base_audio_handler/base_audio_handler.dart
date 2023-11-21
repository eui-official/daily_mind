import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:daily_mind/common_applications/assets.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_variables.dart';
import 'package:daily_mind/common_applications/base_count_down.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/local_notifications.dart';
import 'package:daily_mind/common_applications/online_audio_player/application/online_audio_player.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_applications/sound_effect_audio_player.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/constants/constants.dart';

import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/constants/offline_audio_sources.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'base_audio_on_hold.dart';
part 'base_mix_player.dart';
part 'base_online_player.dart';
part 'base_timer.dart';
part 'base_task.dart';

class DailyMindBackgroundHandler extends BaseAudioHandler
    with
        SeekHandler,
        BaseAudioVariables,
        BaseAudioMixVariables,
        BaseTaskVariables,
        BaseTimer,
        BaseAudioOnHoldVariables {
  DailyMindBackgroundHandler() {
    onInit();
  }

  void onInit() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
  }

  void onUpdatePlaybackStatePlaying(bool isPlaying) {
    playbackState.add(
      playbackState.value.copyWith(
        playing: isPlaying,
      ),
    );
  }

  @override
  Future<void> play() async {
    if (audioType == AudioTypes.mix) {
      onPlayMix();
    } else if (audioType == AudioTypes.online) {
      onPlayOnline();
    }

    onUpdatePlaybackStatePlaying(true);

    return super.play();
  }

  @override
  Future<void> pause() async {
    if (audioType == AudioTypes.mix) {
      onPauseMix();
    } else if (audioType == AudioTypes.online) {
      onPauseOnline();
    }

    onUpdatePlaybackStatePlaying(false);

    return super.pause();
  }

  @override
  Future<void> skipToNext() {
    onPauseOnline();
    onlinePlayer.onSeekNext();

    return super.skipToNext();
  }

  @override
  Future<void> skipToPrevious() {
    onPauseOnline();
    onlinePlayer.onSeekPrevious();

    return super.skipToPrevious();
  }

  @override
  Future<void> seek(Duration position) {
    onlinePlayer.seek(position);

    return super.seek(position);
  }
}
