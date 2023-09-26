import 'package:freezed_annotation/freezed_annotation.dart';

part 'sound_type.freezed.dart';
part 'sound_type.g.dart';

@freezed
class SoundType with _$SoundType {
  const factory SoundType({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    required String name,
  }) = _SoundType;

  factory SoundType.fromJson(Map<String, dynamic> json) =>
      _$SoundTypeFromJson(json);
}
