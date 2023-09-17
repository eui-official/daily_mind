import 'package:freezed_annotation/freezed_annotation.dart';

part 'sound.freezed.dart';
part 'sound.g.dart';

@freezed
class Sound with _$Sound {
  const factory Sound({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    required String name,
    required String image,
    required String source,
    required bool isLive,
    required int category,
  }) = _Sound;

  factory Sound.fromJson(Map<String, dynamic> json) => _$SoundFromJson(json);
}
