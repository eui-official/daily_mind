import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_player/domain/online_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const initialState = OnlinePlayerState(
  isExpanded: false,
  id: kEmptyString,
  name: kEmptyString,
);

class OnlinePlayerNotifier extends StateNotifier<OnlinePlayerState> {
  OnlinePlayerNotifier() : super(initialState);

  void onToggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void onUpdateOpenFrom(String? name) {
    state = state.copyWith(name: name ?? kEmptyString);
  }

  void onUpdateId(dynamic id) {
    state = state.copyWith(id: id);
  }

  void onReset() {
    state = initialState;
  }
}

final onlinePlayerProvider =
    StateNotifierProvider<OnlinePlayerNotifier, OnlinePlayerState>((ref) {
  return OnlinePlayerNotifier();
});
