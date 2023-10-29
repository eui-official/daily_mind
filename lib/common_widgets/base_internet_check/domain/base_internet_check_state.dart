import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_internet_check_state.freezed.dart';

@freezed
class BaseInternetCheckState with _$BaseInternetCheckState {
  const BaseInternetCheckState._();

  const factory BaseInternetCheckState({
    required ConnectivityResult connectivityResult,
  }) = _BaseInternetCheckState;

  bool get isDisconnected => connectivityResult == ConnectivityResult.none;
}
