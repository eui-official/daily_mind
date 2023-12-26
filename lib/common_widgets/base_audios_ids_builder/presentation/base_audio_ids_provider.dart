import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_widgets/base_audios_ids_builder/application/base_audio_ids_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_audio_ids_provider.g.dart';

@riverpod
class BaseAudioIdsNotifier extends _$BaseAudioIdsNotifier {
  @override
  BaseAudioIdsState build(List<String> ids) {
    onInit(ids);

    return const BaseAudioIdsState(audios: []);
  }

  void onInit(List<String> ids) async {
    final audios = await supabaseAPI.onGetAudiosByIds(ids);

    state = state.copyWith(audios: audios);
  }
}
