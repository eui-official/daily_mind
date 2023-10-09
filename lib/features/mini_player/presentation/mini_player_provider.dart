import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/mini_player/domain/mini_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initState = MiniPlayerState(
  image: emptyWidget,
  isShow: false,
  networkType: NetworkType.none,
  onPressed: () {},
  processingStateStream: const Stream.empty(),
  title: emptyString,
);

class MiniPlayerProvider extends StateNotifier<MiniPlayerState> {
  MiniPlayerProvider() : super(initState);

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

final miniPlayerProvider =
    StateNotifierProvider<MiniPlayerProvider, MiniPlayerState>((ref) {
  return MiniPlayerProvider();
});
