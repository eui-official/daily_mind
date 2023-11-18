part of 'base_audio_handler.dart';

extension BaseMixPlayer on DailyMindBackgroundHandler {
  void onInitMix(Playlist playlist) async {
    audioType = AudioTypes.mix;
    await onMixDispose();
    await onOnlineDispose();

    final itemInfos = playlist.items ?? [];
    final mixItems = itemInfos.map((info) {
      final player = GaplessAudioPlayer();
      player.setVolume(info.volume);

      return MixItem(
        player: player,
        audio: info.id.onGetOfflineAudio,
      );
    }).toList();

    if (mixItems.isNotEmpty) {
      for (var item in mixItems) {
        item.player.onSetSource(item.audio.id);
        item.player.setVolume(item.player.volume);
      }

      onStreamMixItems.add(mixItems);

      final firstItem = mixItems.first;

      mediaItem.add(
        MediaItem(
          id: firstItem.audio.id,
          title: playlist.title ?? emptyString,
          artUri: await onGetSoundImageFromAsset(firstItem.audio.image),
        ),
      );

      play();
      onInitPlaybackState();
    }
  }

  void onUpdateMediaItem() async {
    final firstItem = mixItems.first;

    final title = mixItems.map((item) {
      final audio = item.audio;

      return audio.name.tr();
    }).join(', ');

    mediaItem.add(
      MediaItem(
        id: firstItem.audio.id,
        title: title,
        artUri: await onGetSoundImageFromAsset(firstItem.audio.image),
      ),
    );
  }

  void onRemoveMixItem(MixItem removeItem) {
    final newMixItems = List<MixItem>.from(mixItems);
    final item = newMixItems.firstWhere((item) => item == removeItem);
    item.player.onDispose();

    newMixItems.remove(item);

    onStreamMixItems.add(newMixItems);
    onUpdateMediaItem();
  }

  void onAddMixItem(MixItem newItem) async {
    audioType = AudioTypes.mix;
    onStreamMixItems.add([...mixItems, newItem]);

    final audio = newItem.audio;
    final player = newItem.player;

    player.onSetSource(audio.id);
    player.play();

    onUpdateMediaItem();
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
