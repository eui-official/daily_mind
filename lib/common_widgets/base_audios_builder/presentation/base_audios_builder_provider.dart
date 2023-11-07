import 'package:collection/collection.dart';
import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_audios_builder_provider.g.dart';

@riverpod
class BaseAudiosBuilderNotifier extends _$BaseAudiosBuilderNotifier {
  @override
  Future<List<AudioCategory>> build() => onGetAudioCategories();

  Future<void> onRefreshAudioCategories() async {
    final configNotifier = ref.read(configProvider.notifier);
    await configNotifier.onGetBaseConfig();
    final itemCategories = await onGetAudioCategories();

    update((state) => itemCategories);
  }

  Future<List<AudioCategory>> onGetAudioCategories() async {
    final configState = ref.read(configProvider);

    final rawAudios =
        await supabase.from('audios').select().order('created_at');

    List<Audio> audios = [];

    for (final audio in rawAudios) {
      audios.add(Audio.fromJson(audio));
    }

    final groupAudios = audios.groupListsBy((audio) => audio.category);

    List<AudioCategory> listAudioCategory = [];

    groupAudios.forEach((categoryId, audios) {
      final category = configState.categories
          .firstWhere((category) => category.id == categoryId);

      listAudioCategory.add(
        AudioCategory(
          category: category,
          audios: audios,
        ),
      );
    });

    return listAudioCategory;
  }
}
