import 'package:daily_mind/features/online_player/domain/online_player_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'online_player_provider.g.dart';

@riverpod
class OnlinePlayerNotifier extends _$OnlinePlayerNotifier {
  @override
  OnlinePlayerState build() => const OnlinePlayerState(isExpanded: false);

  void onToggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }
}
