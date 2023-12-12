part of 'base_audio_handler.dart';

extension BaseMixPlayer on DailyMindBackgroundHandler {
  void onInitMix(MixCollection mixCollection) async {
    await onMixDispose();
    await onOnlineDispose();
    audioType = AudioTypes.mix;

    final itemInfos = mixCollection.items ?? [];
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

      onUpdateMediaItem();
      play();
      onInitPlaybackState();
    }
  }

  void onClearBackupMixVolume() {
    backupMixVolumes.clear();
  }

  MixVolume onGetBackupMixVolume(MixItem item) {
    return backupMixVolumes.firstWhere(
      (mixVolume) => mixVolume.id == item.audio.id,
      orElse: () {
        final mixVolume = MixVolume(
          id: item.audio.id,
          volume: item.player.volume,
        );

        backupMixVolumes.add(mixVolume);

        return mixVolume;
      },
    );
  }

  void onUpdateVolumeBasedOnMasterVolume() {
    onMasterVolumeStream.listen((volumeMaster) {
      for (var item in mixItems) {
        final mixVolume = onGetBackupMixVolume(item);

        final volume = mixVolume.volume * volumeMaster;

        item.player.setVolume(volume);
      }
    });
  }

  void onUpdateMediaItem() async {
    if (mixItems.isNotEmpty) {
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
  }

  void onRemoveMixItem(MixItem removeItem) {
    final newMixItems = List<MixItem>.from(mixItems);
    final item = newMixItems.firstWhere((item) => item == removeItem);
    item.player.onDispose();

    newMixItems.remove(item);

    onStreamMixItems.add(newMixItems);
    onUpdateMediaItem();
  }

  Future<void> onAddMixItem(MixItem newItem) async {
    await onOnlineDispose();
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

  void onUpdateMixItemVolume(double volume, MixItem item) {
    final newMixItems = List<MixItem>.from(mixItems);
    final index = newMixItems.indexOf(item);

    newMixItems[index].player.setVolume(volume);

    onStreamMixItems.add(newMixItems);
  }

  void onUpdateMixCollectionTitle(
    String name,
    int playlistId,
  ) {
    final updatedMediaItem = mediaItem.value?.copyWith(title: name);

    mediaItem.add(updatedMediaItem);

    db.onUpdateCollectionTitle(name, playlistId);
  }

  void onPlayMix() {
    onUpdateMediaItem();

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
