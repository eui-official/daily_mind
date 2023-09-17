import 'package:daily_mind/common_domains/sound.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_sound.freezed.dart';
part 'list_sound.g.dart';

@freezed
class ListSound with _$ListSound {
  const factory ListSound({
    required List<Sound> sounds,
  }) = _ListSound;

  factory ListSound.fromJson(Map<String, dynamic> json) =>
      _$ListSoundFromJson(json);
}
