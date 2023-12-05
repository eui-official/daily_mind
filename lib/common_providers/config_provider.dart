import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/config_state.dart';
import 'package:daily_mind/common_domains/group.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigNotifier extends StateNotifier<ConfigState> {
  ConfigNotifier()
      : super(
          const ConfigState(
            isLoading: true,
            groups: [],
            categories: [],
          ),
        ) {
    onGetBaseConfig();
  }

  Future<void> onGetBaseConfig() async {
    final List<Category> categories = await supabaseAPI.onGetCategories();
    final List<Group> groups = await supabaseAPI.onGetGroups();

    state = state.copyWith(
      isLoading: false,
      categories: categories,
      groups: groups,
    );
  }
}

final configProvider =
    StateNotifierProvider<ConfigNotifier, ConfigState>((ref) {
  return ConfigNotifier();
});
