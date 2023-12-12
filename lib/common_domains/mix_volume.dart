import 'package:freezed_annotation/freezed_annotation.dart';

part 'mix_volume.freezed.dart';

@freezed
class MixVolume with _$MixVolume {
  const factory MixVolume({
    required String id,
    required double volume,
  }) = _MixVolume;
}
