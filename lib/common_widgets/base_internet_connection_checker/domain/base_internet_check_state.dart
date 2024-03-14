import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_internet_check_state.freezed.dart';

@freezed
class BaseInternetCheckState with _$BaseInternetCheckState {
  const BaseInternetCheckState._();

  const factory BaseInternetCheckState({
    required bool hasInternetAccess,
  }) = _BaseInternetCheckState;

  bool get isDisconnected => !hasInternetAccess;
}
