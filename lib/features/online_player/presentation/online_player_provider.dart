import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_player/domain/online_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerNotifier extends StateNotifier<OnlinePlayerState> {
  OnlinePlayerNotifier()
      : super(const OnlinePlayerState(
          isExpanded: false,
          name: kEmptyString,
        ));

  void onToggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void onUpdateOpenFrom(String name) {
    state = state.copyWith(name: name);
  }
}

final onlinePlayerProvider =
    StateNotifierProvider<OnlinePlayerNotifier, OnlinePlayerState>((ref) {
  return OnlinePlayerNotifier();
});
