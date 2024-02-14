import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_navigation_bar_state.freezed.dart';

@freezed
class AppNavigationBarState with _$AppNavigationBarState {
  const AppNavigationBarState._();

  const factory AppNavigationBarState({
    required int index,
  }) = _AppNavigationBarState;

  bool get isActivityScreen => index == 0;
  bool get isMixScreen => index == 1;
  bool get isExploreScreen => index == 2;
  bool get isSettingsScreen => index == 3;
}
