import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daily_mind/common_widgets/base_internet_check/domain/base_internet_check_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_internet_check_provider.g.dart';

@riverpod
class BaseInternetCheckNotifier extends _$BaseInternetCheckNotifier {
  @override
  Future<BaseInternetCheckState> build() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    return BaseInternetCheckState(connectivityResult: connectivityResult);
  }

  void onConnectivityChanged(ConnectivityResult connectivityResult) {
    update((state) => state.copyWith(connectivityResult: connectivityResult));
  }
}
