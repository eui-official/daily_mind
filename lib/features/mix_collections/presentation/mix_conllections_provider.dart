import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mix_conllections_provider.g.dart';

@riverpod
class MixCollectionsNotifier extends _$MixCollectionsNotifier {
  @override
  List<Playlist> build() {
    onStreamAllPlaylists();

    return db.onGetAllPlaylists();
  }

  void onStreamAllPlaylists() {
    db.onStreamAllPlaylists().listen((playlists) {
      state = playlists;
    });
  }
}
