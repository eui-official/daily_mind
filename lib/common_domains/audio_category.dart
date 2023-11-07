import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_category.freezed.dart';

@freezed
class AudioCategory with _$AudioCategory {
  const factory AudioCategory({
    required Category category,
    required List<Audio> audios,
  }) = _AudioCategory;
}
