import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focus_mode_list_provider.g.dart';

@riverpod
class FocusModeListNotifier extends _$FocusModeListNotifier {
  @override
  List<Task> build() {
    onWatchPomodoros();

    return db.onGetTasks();
  }

  void onWatchPomodoros() {
    db.onStreamTasks().listen((tasks) {
      state = tasks;
    });
  }
}
