import 'package:daily_mind/common_applications/audio.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/from_source.dart';
import 'package:daily_mind/common_domains/group.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SupabaseAPI {
  // Get audios from ids
  Future<List<Audio>> onGetAudiosByIds(List<String> ids) async {
    final rawAudios =
        await supabase.from('audios').select().inFilter('id', ids);

    return onToAudios(rawAudios);
  }

  Future<Audio> onGetAudioById(String id) async {
    final rawAudio =
        await supabase.from('audios').select().eq('id', id).single();

    return Audio.fromJson(rawAudio);
  }

  // Get audios
  Future<List<Audio>> onGetAudios() async {
    final rawAudios =
        await supabase.from('audios').select().order('created_at');

    return onToAudios(rawAudios);
  }

  // Get categories
  Future<List<Category>> onGetCategories() async {
    final List<Category> categories = [];

    final categoriesData = await supabase.from('categories').select();

    for (var data in categoriesData) {
      categories.add(Category.fromJson(data));
    }

    return categories;
  }

  Future<List<FromSource>> onGetFromSources() async {
    final List<FromSource> fromSources = [];

    final fromSourcesData = await supabase.from('from_sources').select();

    for (var data in fromSourcesData) {
      fromSources.add(FromSource.fromJson(data));
    }

    return fromSources;
  }

  // Get groups
  Future<List<Group>> onGetGroups() async {
    final List<Group> groups = [];

    final groupsData = await supabase.from('groups').select();

    for (var data in groupsData) {
      groups.add(Group.fromJson(data));
    }

    return groups;
  }
}

final supabaseAPI = SupabaseAPI();
