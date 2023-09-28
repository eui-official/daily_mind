import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_category.freezed.dart';

@freezed
class StoryCategory with _$StoryCategory {
  const factory StoryCategory({
    required Category category,
    required List<Story> stories,
  }) = _StoryCategory;
}
