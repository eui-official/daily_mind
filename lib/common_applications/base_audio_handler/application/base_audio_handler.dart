import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:daily_mind/common_applications/assets.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/online_audio_player/application/online_audio_player.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_applications/time.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/offline_player/domain/offline_player_item.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:rxdart/rxdart.dart';

part 'base_online_player.dart';
part 'base_offline_player.dart';
part 'base_player_timer.dart';

class DailyMindAudioHandler extends BaseAudioHandler with SeekHandler {
  bool isAutoPlayNext = true;
  List<OfflinePlayerItem> offlinePlayerItems = [];
  NetworkType networkType = NetworkType.none;
  OnlineAudioPlayer onlinePlayer = OnlineAudioPlayer();
  StreamController<int> streamPlaylistId = BehaviorSubject();
  StreamSubscription<Duration?>? durationStreamSubscription;
  StreamSubscription<Duration>? positionStreamSubscription;
  Timer? timer;

  DailyMindAudioHandler() {
    onInit();
  }

  void onInit() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
  }

  void onInitPlaybackState([NetworkType type = NetworkType.offline]) async {
    final controls = [
      MediaControl.pause,
      MediaControl.play,
    ];
    final Set<MediaAction> actions = {};

    if (type == NetworkType.online) {
      controls.addAll([
        MediaControl.skipToNext,
        MediaControl.skipToPrevious,
      ]);

      actions.addAll(
        [
          MediaAction.seek,
          MediaAction.seekBackward,
          MediaAction.seekForward,
        ],
      );
    }

    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        controls: controls,
        systemActions: actions,
      ),
    );
  }

  void onSetNetwork(NetworkType newNetworkType) {
    networkType = newNetworkType;
  }

  @override
  Future<void> play() async {
    if (networkType == NetworkType.offline) {
      onPlayOffline();
    } else {
      onPlayOnline();
    }

    playbackState.add(playbackState.value.copyWith(playing: true));

    return super.play();
  }

  @override
  Future<void> pause() async {
    onPauseOffline();
    onPauseOnline();
    playbackState.add(playbackState.value.copyWith(playing: false));

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
