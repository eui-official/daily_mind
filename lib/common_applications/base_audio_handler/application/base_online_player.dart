part of 'base_audio_handler.dart';

extension BaseOnlinePlayer on DailyMindAudioHandler {
  void onInitOnline(List<Audio> audios) async {
    onOfflineDispose();
    onOnlineDispose();

    onlinePlayer = OnlineAudioPlayer();

    onlinePlayer.onInitSource(audios);

    onSetNetwork(NetworkType.online);

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

      onSafeValueBuilder(duration, (value) {
        if (value <= newDuration && isAutoPlayNext) {
          skipToNext();
        }
      });
    });

    durationStreamSubscription = onlinePlayer.durationStream.listen((duration) {
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

  void onOnlineDispose() {
    onlinePlayer.dispose();
  }

  void onPauseOnline() {
    onlinePlayer.pause();
  }

  void onPlayOnline() {
    onlinePlayer.play();
  }

  void onDisposeOnline() async {
    await onlinePlayer.onDispose();
  }

  void onOnlineUpdateAutoPlayNext(bool newIsAutoPlayNext) {
    isAutoPlayNext = newIsAutoPlayNext;
  }
}
