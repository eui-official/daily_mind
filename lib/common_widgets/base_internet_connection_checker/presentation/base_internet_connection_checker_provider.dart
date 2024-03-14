import 'package:daily_mind/common_widgets/base_internet_connection_checker/domain/base_internet_check_state.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_internet_connection_checker_provider.g.dart';

@riverpod
class BaseInternetConnectionCheckerNotifier
    extends _$BaseInternetConnectionCheckerNotifier {
  @override
  Future<BaseInternetCheckState> build() async {
    bool hasInternetAccess = await InternetConnection().hasInternetAccess;

    return BaseInternetCheckState(hasInternetAccess: hasInternetAccess);
  }

  void onConnectivityChanged(bool hasInternetAccess) {
    update((state) => state.copyWith(hasInternetAccess: hasInternetAccess));
  }
}
