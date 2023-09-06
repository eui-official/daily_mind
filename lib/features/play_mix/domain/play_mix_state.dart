import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_mix_state.freezed.dart';

@freezed
class PlayMixState with _$PlayMixState {
  const factory PlayMixState({
    Time? time,
  }) = _PlayMixState;
}
