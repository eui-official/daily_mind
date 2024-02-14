import 'package:daily_mind/features/app_navigation_bar/domain/app_navigation_bar_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_navigation_bar_provider.g.dart';

@riverpod
class AppNavigationBarNotifier extends _$AppNavigationBarNotifier {
  @override
  AppNavigationBarState build() => const AppNavigationBarState(index: 0);

  void onTap(int index) {
    state = state.copyWith(index: index);
  }
}
