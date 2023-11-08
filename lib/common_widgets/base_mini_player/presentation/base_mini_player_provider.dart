import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const initState = MiniPlayerState(
  isShow: false,
  audioType: AudioTypes.none,
);

class BaseMiniPlayerProvider extends StateNotifier<MiniPlayerState> {
  BaseMiniPlayerProvider() : super(initState);

  void onHide() {
    state = state.copyWith(isShow: false);
  }

  void onShow() {
    state = state.copyWith(isShow: true);
  }

  void onUpdateState(MiniPlayerState newState) {
    state = newState;
  }
}

final baseMiniPlayerProvider =
    StateNotifierProvider<BaseMiniPlayerProvider, MiniPlayerState>((ref) {
  return BaseMiniPlayerProvider();
});
