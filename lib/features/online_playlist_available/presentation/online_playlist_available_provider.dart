import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'online_playlist_available_provider.g.dart';

@riverpod
class OnlinePlaylistAvailableNotifier
    extends _$OnlinePlaylistAvailableNotifier {
  @override
  List<OnlinePlaylist> build() {
    onStreamOnlinePlaylists();

    return db.onGetOnlinePlaylists();
  }

  void onStreamOnlinePlaylists() {
    db.onStreamOnlinePlaylists().listen((onlinePlaylists) {
      state = onlinePlaylists;
    });
  }
}
