import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/list_mix/domain/list_chore_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListChoreNotifier extends StateNotifier<ListChoreState> {
  ListChoreNotifier()
      : super(
          const ListChoreState(
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

final listChoreProvider =
    StateNotifierProvider<ListChoreNotifier, ListChoreState>((ref) {
  return ListChoreNotifier();
});
