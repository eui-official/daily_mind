import 'package:daily_mind/constants/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selecting_state.freezed.dart';

@freezed
class SelectingState with _$SelectingState {
  const SelectingState._();

  const factory SelectingState({
    required dynamic sound,
    required NetworkType networkType,
  }) = _SelectingState;

  bool get isEmpty => sound == null;
}
