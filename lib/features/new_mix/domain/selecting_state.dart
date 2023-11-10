import 'package:daily_mind/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selecting_state.freezed.dart';

@freezed
class SelectingState with _$SelectingState {
  const SelectingState._();

  const factory SelectingState({
    required dynamic audio,
    required AudioTypes audioType,
  }) = _SelectingState;
}
