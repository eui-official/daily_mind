import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_time_picker_state.freezed.dart';

@freezed
class BaseTimePickerState with _$BaseTimePickerState {
  const factory BaseTimePickerState({
    Time? time,
  }) = _BaseTimePickerState;
}
