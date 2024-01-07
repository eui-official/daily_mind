import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio.freezed.dart';
part 'audio.g.dart';

@freezed
class Audio with _$Audio {
  const factory Audio({
    @JsonKey(name: 'created_at') required String createdAt,
    required String category,
    required String id,
    required String image,
    required String name,
    required String source,
    @JsonKey(name: 'from_source') String? fromSource,
  }) = _Audio;

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
}
