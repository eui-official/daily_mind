import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/config_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigNotifier extends StateNotifier<ConfigState> {
  ConfigNotifier()
      : super(
          const ConfigState(
            isLoading: true,
            categories: [],
          ),
        ) {
    onGetBaseConfig();
  }

  Future<void> onGetBaseConfig() async {
    final List<Category> categories = [];

    final categoriesData =
        await supabase.from('categories').select() as List<dynamic>;

    for (var data in categoriesData) {
      categories.add(Category.fromJson(data));
    }

    state = state.copyWith(
      isLoading: false,
      categories: categories,
    );
  }
}

final configProvider =
    StateNotifierProvider<ConfigNotifier, ConfigState>((ref) {
  return ConfigNotifier();
});
