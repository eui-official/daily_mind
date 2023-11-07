import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio.freezed.dart';
part 'audio.g.dart';

@freezed
class Audio with _$Audio {
  const factory Audio({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    required String name,
    required String image,
    required String source,
    required String category,
  }) = _Audio;

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
}
