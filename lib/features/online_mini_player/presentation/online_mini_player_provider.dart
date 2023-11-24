import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/features/online_mini_player/domain/online_mini_player_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'online_mini_player_provider.g.dart';

@riverpod
class OnlineMiniPlayerNotifier extends _$OnlineMiniPlayerNotifier {
  @override
  OnlineMiniPlayerState build() => const OnlineMiniPlayerState();

  void onUpdate(Category category) {
    state = state.copyWith(category: category);
  }
}
