import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_player/domain/online_player_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'online_player_provider.g.dart';

const initialState = OnlinePlayerState(
  isExpanded: false,
  id: kEmptyString,
);

@riverpod
class OnlinePlayerNotifier extends _$OnlinePlayerNotifier {
  @override
  OnlinePlayerState build() => initialState;

  void onToggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void onUpdateTitle(String? title) {
    state = state.copyWith(title: title);
  }

  void onUpdateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void onUpdateId(dynamic id) {
    state = state.copyWith(id: id);
  }

  void onReset() {
    state = initialState;
  }
}
