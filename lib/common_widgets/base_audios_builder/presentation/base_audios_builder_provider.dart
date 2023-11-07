import 'package:collection/collection.dart';
import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/types/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_audios_builder_provider.g.dart';

@riverpod
class BaseAudiosBuilderNotifier extends _$BaseAudiosBuilderNotifier {
  @override
  Future<AudioCategoryGroup> build() => onGetAudioCategories();

  Future<void> onRefreshAudioCategories() async {
    final configNotifier = ref.read(configProvider.notifier);
    await configNotifier.onGetBaseConfig();
    final itemCategories = onGetAudioCategories();

    update((state) => itemCategories);
  }

  Future<AudioCategoryGroup> onGetAudioCategories() async {
    final configState = ref.read(configProvider);

    final rawAudios =
        await supabase.from('audios').select().order('created_at');

    List<Audio> audios = [];

    for (final audio in rawAudios) {
      audios.add(Audio.fromJson(audio));
    }

    final groupAudios = audios.groupListsBy((audio) => audio.category);

    List<AudioCategory> audioCategories = [];

    groupAudios.forEach((categoryId, audios) {
      final category = configState.categories
          .firstWhere((category) => category.id == categoryId);

      audioCategories.add(
        AudioCategory(
          category: category,
          audios: audios,
        ),
      );
    });

    final groupAudioCategories = audioCategories
        .groupListsBy((audioCategory) => audioCategory.category.group);

    return groupAudioCategories;
  }
}
