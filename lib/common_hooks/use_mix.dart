import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

({
  bool isPlaying,
  List<MixItem> mixItems,
  MediaItem? mediaItem,
}) useMix(WidgetRef ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

  final playBackState = useStream(baseBackgroundHandler.playbackState);
  final isPlaying = playBackState.data?.playing ?? false;

  final mixItemsSnapshot = useStream(baseBackgroundHandler.onStreamMixItems);
  final mixItemsData = mixItemsSnapshot.data ?? [];
  final mixItems = mixItemsData.map((item) {
    return MixItem(
      player: item.player,
      audio: item.audio,
    );
  }).toList();

  final mediaItemSnapshot = useStream(baseBackgroundHandler.mediaItem);
  final mediaItem = mediaItemSnapshot.data;

  return (
    isPlaying: isPlaying,
    mixItems: mixItems,
    mediaItem: mediaItem,
  );
}
