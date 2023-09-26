import 'package:daily_mind/features/new_mix/constant/network_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selecting_state.freezed.dart';

@freezed
class SelectingState with _$SelectingState {
  const factory SelectingState({
    required dynamic sound,
    required NetworkType networkType,
  }) = _SelectingState;
}
