import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/mini_player/domain/mini_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initState = MiniPlayerState(
  isShow: false,
  onPressed: () {},
  title: emptyString,
  image: emptyWidget,
  networkType: NetworkType.none,
);

class MiniPlayerProvider extends StateNotifier<MiniPlayerState> {
  MiniPlayerProvider() : super(initState);

  void onUpdateState(MiniPlayerState newState) {
    state = newState;
  }
}

final miniPlayerProvider =
    StateNotifierProvider<MiniPlayerProvider, MiniPlayerState>((ref) {
  return MiniPlayerProvider();
});
