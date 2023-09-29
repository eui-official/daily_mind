import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/mini_player/domain/mini_player_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MiniPlayerProvider extends StateNotifier<MiniPlayerState> {
  MiniPlayerProvider()
      : super(
          MiniPlayerState(
            isShow: false,
            onPressed: () {},
            title: emptyString,
          ),
        );

  void onUpdateState(MiniPlayerState newState) {
    state = newState;
  }
}

final miniPlayerProvider =
    StateNotifierProvider<MiniPlayerProvider, MiniPlayerState>((ref) {
  return MiniPlayerProvider();
});
