import 'package:daily_mind/features/app_navigation_bar/domain/app_navigation_bar_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppNavigationBarNotifier extends StateNotifier<AppNavigationBarState> {
  AppNavigationBarNotifier() : super(const AppNavigationBarState(index: 0));

  void onTap(int index) {
    state = state.copyWith(index: index);
  }
}

final appNavigationBarProvider =
    StateNotifierProvider<AppNavigationBarNotifier, AppNavigationBarState>(
        (ref) {
  return AppNavigationBarNotifier();
});
