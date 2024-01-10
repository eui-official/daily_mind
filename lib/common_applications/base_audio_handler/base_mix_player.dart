part of 'base_audio_handler.dart';

extension BaseMixPlayer on DailyMindBackgroundHandler {
  void onInitMix(MixCollection mixCollection) async {
    await onMixDispose();
    await onOnlineDispose();
    onClearBackupMixVolumes();
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

      onUpdateMediaItem(mixCollection.title);
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

  void onClearBackupMixVolumes() {
    backupMixVolumes.clear();
  }

  void onRemoveBackupMixVolume(MixItem item) {
    backupMixVolumes.removeWhere((mixVolume) => mixVolume.id == item.id);
  }

  void onUpdateVolumeForBackupMixVolume(double volume, MixItem item) {
    final index =
        backupMixVolumes.indexWhere((mixVolume) => mixVolume.id == item.id);

    if (index != -1) {
      final mixVolume = backupMixVolumes[index];
      backupMixVolumes[index] = mixVolume.copyWith(volume: volume);
    }
  }

  void onUpdateMixVolumeBasedOnMasterVolume() {
    onMasterVolumeStream.listen((volumeMaster) {
      for (var item in mixItems) {
        final mixVolume = onGetBackupMixVolume(item);

        final volume = mixVolume.volume * volumeMaster;

        item.player.setVolume(volume);
      }
    });
  }

  void onUpdateMediaItem([String? initialTitle]) async {
    if (mixItems.isNotEmpty) {
      final firstItem = mixItems.first;

      final itemTitle = mixItems.map((item) {
        final audio = item.audio;

        return audio.name.tr();
      }).join(', ');

      mediaItem.add(
        MediaItem(
          id: firstItem.audio.id,
          title: initialTitle ?? itemTitle,
          artUri: await onGetSoundImageFromAsset(firstItem.audio.image),
        ),
      );
    }
  }

  void onRemoveMixItem(MixItem removeItem) {
    final newMixItems = List<MixItem>.from(mixItems);
    final item = newMixItems.firstWhere((item) => item == removeItem);
    item.player.onDispose();

    onRemoveBackupMixVolume(item);
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

    onUpdateVolumeForBackupMixVolume(volume, item);
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
