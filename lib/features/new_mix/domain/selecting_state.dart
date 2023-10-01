import 'package:daily_mind/constants/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selecting_state.freezed.dart';

@freezed
class SelectingState with _$SelectingState {
  const factory SelectingState({
    required dynamic sound,
    required NetworkType networkType,
  }) = _SelectingState;
}
