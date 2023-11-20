import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mix_tabbar_provider.g.dart';

@riverpod
class MixTabbarNotifier extends _$MixTabbarNotifier {
  @override
  int build() => 0;

  void onTap(int newIndex) {
    state = newIndex;
  }
}
