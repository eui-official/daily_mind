import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Playlist usePlaylistFromAudioHandler(WidgetRef ref) {
  final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

  final currentPlaylistIdSnapshot =
      useStream(baseAudioHandler.streamPlaylistId.stream);

  final currentPlaylistId = currentPlaylistIdSnapshot.data ?? 0;

  final playlistSnapshot =
      useStream(db.onStreamPlaylistById(currentPlaylistId));

  final playlist = playlistSnapshot.data ?? Playlist();

  return playlist;
}
