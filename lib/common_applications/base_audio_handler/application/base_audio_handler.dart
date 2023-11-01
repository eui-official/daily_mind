import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:daily_mind/common_applications/assets.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/online_audio_player/application/online_audio_player.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_applications/time.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/offline_player/domain/offline_player_item.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:rxdart/rxdart.dart';

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

  void onStartTimer(Time time) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (currentTimer) {
      if (isBefore(time)) {
        pause();
        timer?.cancel();
      }
    });
  }

  void onDeletedTimer() {
    timer?.cancel();
  }

  void onInitOffline(Playlist playlist) async {
    onClearOfflinePlayerItems();
    onPauseOnline();

    streamPlaylistId.add(playlist.id);

    final items = playlist.items ?? [];

    for (var item in items) {
      final player = GaplessAudioPlayer();

      player.onSetSource(item.id);
      player.setVolume(item.volume);

      offlinePlayerItems.add(
        OfflinePlayerItem(
          player: player,
          id: item.id,
        ),
      );

      mediaItem.add(
        MediaItem(
          id: '${playlist.id}',
          title: playlist.title ?? appDescription,
          artUri: await onGetSoundImageFromAsset(item.id),
        ),
      );

      networkType = NetworkType.offline;

      play();
      onInitPlaybackState();
    }
  }

  void onUpdateOfflineVolume(double volume, String itemId, int playlistId) {
    final offlinePlayerItem =
        offlinePlayerItems.firstWhere((item) => item.id == itemId);
    offlinePlayerItem.player.setVolume(volume);

    db.onUpdateVolume(volume, itemId, playlistId);
  }

  void onUpdateOfflinePlaylistTitle(
    String name,
    int playlistId,
  ) {
    final updatedMediaItem = mediaItem.value?.copyWith(title: name);

    mediaItem.add(updatedMediaItem);

    db.onUpdatePlaylistTitle(name, playlistId);
  }

  void onPlayOffline() {
    for (var offlinePlayerItem in offlinePlayerItems) {
      offlinePlayerItem.player.play();
    }
  }

  void onPauseOffline() {
    for (var offlinePlayerItem in offlinePlayerItems) {
      offlinePlayerItem.player.pause();
    }
  }

  void onClearOfflinePlayerItems() {
    onOfflineDispose();

    offlinePlayerItems.clear();
  }

  void onOfflineDispose() {
    for (var offlinePlayerItem in offlinePlayerItems) {
      offlinePlayerItem.player.onDispose();
    }
  }

  void onInitOnline(List<Item> items) async {
    onPauseOffline();

    onlinePlayer.onInitSource(items);

    networkType = NetworkType.online;

    onInitPlaybackState(NetworkType.online);
    onOnlinePlayerPlayStateChanged();
  }

  void onOnlinePlayerPlayStateChanged() {
    positionStreamSubscription?.cancel();
    durationStreamSubscription?.cancel();

    positionStreamSubscription =
        onlinePlayer.positionStream.listen((newDuration) {
      playbackState.add(
        playbackState.value.copyWith(updatePosition: newDuration),
      );

      final duration = onlinePlayer.duration;

      safeValueBuilder(duration, (value) {
        if (value <= newDuration && isAutoPlayNext) {
          skipToNext();
        }
      });
    });

    durationStreamSubscription = onlinePlayer.durationStream.listen((duration) {
      safeValueBuilder(duration, (value) {
        if (value != Duration.zero) {
          final tag = onlinePlayer.sequenceState?.currentSource?.tag;

          safeValueBuilder<dynamic>(tag, (item) {
            mediaItem.add(
              MediaItem(
                id: item.source,
                title: item.name,
                artUri: Uri.parse(item.image),
                duration: value,
              ),
            );
          });
        }
      });
    });
  }

  void onClearOnline() {
    onlinePlayer.dispose();
  }

  void onPauseOnline() {
    onlinePlayer.pause();
  }

  void onPlayOnline() {
    onlinePlayer.play();
  }

  void onOnlineUpdateAutoPlayNext(bool newIsAutoPlayNext) {
    isAutoPlayNext = newIsAutoPlayNext;
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
