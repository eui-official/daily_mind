import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/sound_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_state.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState({
    required List<Category> categories,
    required List<SoundType> soundTypes,
    required bool isLoading,
  }) = _ConfigState;
}
