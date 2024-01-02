part of 'base_audio_handler.dart';

extension BaseOnlinePlayer on DailyMindBackgroundHandler {
  Future<void> onInitOnline(
    List<Audio> audios, {
    int index = 0,
  }) async {
    await onMixDispose();
    await onOnlineDispose();

    onlinePlayer = OnlineAudioPlayer();

    await onlinePlayer.onInitSource(
      audios,
      index: index,
    );

    audioType = AudioTypes.online;

    onInitPlaybackState();
    onOnlinePlayerPlayStateChanged();
  }

  void onInitPlaybackState() async {
    final controls = [
      MediaControl.pause,
      MediaControl.play,
      MediaControl.skipToNext,
      MediaControl.skipToPrevious,
    ];
    final Set<MediaAction> actions = {
      MediaAction.seek,
      MediaAction.seekBackward,
      MediaAction.seekForward,
    };

    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        controls: controls,
        systemActions: actions,
      ),
    );
  }

  void onUpdateOnlineVolumeBasedOnMasterVolume() {
    onMasterVolumeStream.listen((volumeMaster) {
      onlinePlayer.setVolume(volumeMaster);
    });
  }

  void onOnlinePlayerPlayStateChanged() {
    onStreamPosition?.cancel();
    onStreamDuration?.cancel();

    onStreamPosition = onlinePlayer.positionStream.listen((newDuration) {
      playbackState.add(
        playbackState.value.copyWith(updatePosition: newDuration),
      );

      final duration = onlinePlayer.duration;

      onSafeValueBuilder(duration, (value) {
        if (value <= newDuration && isAutoPlayNext) {
          skipToNext();
        }
      });
    });

    onStreamDuration = onlinePlayer.durationStream.listen((duration) {
      onSafeValueBuilder(duration, (value) {
        if (value != Duration.zero) {
          final tag = onlinePlayer.sequenceState?.currentSource?.tag;

          onSafeValueBuilder<dynamic>(tag, (item) {
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

  void onPauseOnline() {
    onlinePlayer.pause();
  }

  void onPlayOnline() {
    onlinePlayer.play();
  }

  Future<void> onOnlineDispose() async {
    await onlinePlayer.onDispose();
  }

  void onOnlineUpdateAutoPlayNext(bool newIsAutoPlayNext) {
    isAutoPlayNext = newIsAutoPlayNext;
  }
}
