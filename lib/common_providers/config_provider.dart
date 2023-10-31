import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/config_state.dart';
import 'package:daily_mind/common_domains/sound_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigNotifier extends StateNotifier<ConfigState> {
  ConfigNotifier()
      : super(
          const ConfigState(
            isLoading: true,
            categories: [],
            soundTypes: [],
          ),
        ) {
    init();
  }

  void init() async {
    final List<Category> categories = [];
    final List<SoundType> soundTypes = [];

    final categoriesData =
        await supabase.from('categories').select() as List<dynamic>;
    final soundTypesData =
        await supabase.from('soundtypes').select() as List<dynamic>;

    for (var data in categoriesData) {
      categories.add(Category.fromJson(data));
    }

    for (var data in soundTypesData) {
      soundTypes.add(SoundType.fromJson(data));
    }

    state = state.copyWith(
      isLoading: false,
      categories: categories,
      soundTypes: soundTypes,
    );
  }
}

final configProvider =
    StateNotifierProvider<ConfigNotifier, ConfigState>((ref) {
  return ConfigNotifier();
});
