import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_navigation_bar_state.freezed.dart';

@freezed
class AppNavigationBarState with _$AppNavigationBarState {
  const factory AppNavigationBarState({
    required int index,
  }) = _AppNavigationBarState;
}
