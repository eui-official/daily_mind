import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/offline_list_chord/domain/offline_list_chore_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListChoreNotifier extends StateNotifier<OfflineListChoreState> {
  OfflineListChoreNotifier()
      : super(
          const OfflineListChoreState(
            isLoading: true,
            playlists: [],
          ),
        ) {
    init();
  }

  void init() {
    final playlists = db.getAllPlaylists();

    state = state.copyWith(
      playlists: playlists,
      isLoading: false,
    );

    db.streamAllPlaylists().listen((playlists) {
      state = state.copyWith(
        playlists: playlists,
      );
    });
  }
}

final offlineListChoreProvider =
    StateNotifierProvider<OfflineListChoreNotifier, OfflineListChoreState>(
        (ref) {
  return OfflineListChoreNotifier();
});
