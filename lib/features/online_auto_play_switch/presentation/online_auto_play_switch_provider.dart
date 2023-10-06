import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineAutoPlaySwitchNotifier extends StateNotifier<bool> {
  OnlineAutoPlaySwitchNotifier() : super(true);

  void onChanged(bool isAutoPlay) {
    state = isAutoPlay;
  }
}

final onlineAutoPlaySwitchProvider =
    StateNotifierProvider<OnlineAutoPlaySwitchNotifier, bool>((ref) {
  return OnlineAutoPlaySwitchNotifier();
});
