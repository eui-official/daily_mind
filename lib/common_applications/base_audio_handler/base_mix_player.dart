part of 'base_audio_handler.dart';

extension BaseMixPlayer on DailyMindBackgroundHandler {
  void onInitMix(List<MixItem> items) async {
    await onMixDispose();
    await onOnlineDispose();

    if (items.isNotEmpty) {
      for (var item in items) {
        item.player.onSetSource(item.audio.id);
        item.player.setVolume(item.player.volume);
        mixItems.add(item);
      }

      audioType = AudioTypes.mix;

      play();
      onInitPlaybackState();
    }
  }

  void onRemoveMixItem(MixItem item) {
    final item = mixItems.firstWhere((item) => item == item);
    item.player.onDispose();

    mixItems.remove(item);
  }

  void onAddMixItem(MixItem item) async {
    final audio = item.audio;
    final player = item.player;

    player.onSetSource(audio.id);
    player.play();

    mediaItem.add(
      MediaItem(
        id: audio.id,
        title: audio.name.tr(),
      ),
    );

    onInitPlaybackState();

    mixItems.add(item);
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

  void onUpdateMixVolume(double volume, String itemId, int playlistId) {
    final item = mixItems.firstWhere((item) => item.audio.id == itemId);
    item.player.setVolume(volume);

    db.onUpdateVolume(volume, itemId, playlistId);
  }

  void onUpdateMixPlaylistTitle(
    String name,
    int playlistId,
  ) {
    final updatedMediaItem = mediaItem.value?.copyWith(title: name);

    mediaItem.add(updatedMediaItem);

    db.onUpdatePlaylistTitle(name, playlistId);
  }

  void onPlayMix() {
    for (var item in mixItems) {
      item.player.play();
    }
  }

  void onPauseMix() {
    for (var item in mixItems) {
      item.player.pause();
    }
  }

  Future<void> onMixDispose() async {
    for (var item in mixItems) {
      await item.player.onDispose();
    }

    mixItems.clear();
  }
}
