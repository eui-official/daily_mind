import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_domains/artist.dart';
import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/config_state.dart';
import 'package:daily_mind/common_domains/from_source.dart';
import 'package:daily_mind/common_domains/group.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_provider.g.dart';

@riverpod
class ConfigNotifier extends _$ConfigNotifier {
  @override
  Future<ConfigState> build() => onGetBaseConfig();

  Future<ConfigState> onGetBaseConfig() async {
    final List<Category> categories = await supabaseAPI.onGetCategories();
    final List<Group> groups = await supabaseAPI.onGetGroups();
    final List<FromSource> fromSources = await supabaseAPI.onGetFromSources();
    final List<Artist> artists = await supabaseAPI.onGetArtists();

    return ConfigState(
      isLoading: false,
      artists: artists,
      categories: categories,
      fromSources: fromSources,
      groups: groups,
    );
  }
}
