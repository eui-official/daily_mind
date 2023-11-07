import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focus_mode_list_provider.g.dart';

@riverpod
class FocusModeListNotifier extends _$FocusModeListNotifier {
  @override
  List<Pomodoro> build() {
    onWatchPomodoros();

    return db.onGetPomodoros();
  }

  void onWatchPomodoros() {
    db.onStreamPomodoros().listen((pomodoros) {
      state = pomodoros;
    });
  }
}
