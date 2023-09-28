import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    required String name,
    required String image,
    required String source,
    required String category,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
