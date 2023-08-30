import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/db/schemas/playlist.dart';

class PlayMix {
  final List<GaplessAudioPlayer> listPlayers = [];

  void playPlaylist(List<PlaylistItem> items) {}
}

final playMix = PlayMix();
