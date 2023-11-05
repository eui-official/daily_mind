import 'package:daily_mind/common_applications/images.dart';
import 'package:daily_mind/common_providers/domain/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppProvider extends StateNotifier<AppState> {
  AppProvider()
      : super(AppState(backgroundImage: images.onGetRandomBackground));
}

final appProvider = StateNotifierProvider<AppProvider, AppState>((ref) {
  return AppProvider();
});
