part of 'base_audio_handler.dart';

extension BaseOfflinePlayer on DailyMindBackgroundHandler {
  void onInitOffline(Playlist playlist) async {
    onOfflineDispose();
    onOnlineDispose();

    onStreamPlaylistId.add(playlist.id);

    final items = playlist.items ?? [];
    final firstItem = items.first;

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
    }

    mediaItem.add(
      MediaItem(
        id: '${playlist.id}',
        title: playlist.title ?? appDescription,
        artUri: await onGetSoundImageFromAsset(firstItem.id),
      ),
    );

    audioType = AudioTypes.offline;

    play();
    onInitPlaybackState();
  }

  void onInitPlaybackState() async {
    final controls = [
      MediaControl.pause,
      MediaControl.play,
    ];

    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        controls: controls,
      ),
    );
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

  void onOfflineDispose() async {
    for (var offlinePlayerItem in offlinePlayerItems) {
      await offlinePlayerItem.player.onDispose();
    }

    offlinePlayerItems.clear();
  }
}
