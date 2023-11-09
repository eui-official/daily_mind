import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Playlist usePlaylistFromAudioHandler(WidgetRef ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

  final currentPlaylistIdStreamMemoized = useMemoized(
    () => baseBackgroundHandler.onStreamPlaylistId,
    [],
  );

  final currentPlaylistIdSnapshot = useStream(currentPlaylistIdStreamMemoized);

  final currentPlaylistId = currentPlaylistIdSnapshot.data ?? 0;

  final onStreamPlaylistMemoized = useMemoized(
    () => db.onStreamPlaylistById(currentPlaylistId),
    [currentPlaylistId],
  );

  final playlistSnapshot = useStream(onStreamPlaylistMemoized);

  final playlist = playlistSnapshot.data ?? Playlist();

  return playlist;
}
