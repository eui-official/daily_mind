import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focus_mode_provider.g.dart';

@riverpod
class FocusModeNotifier extends _$FocusModeNotifier {
  @override
  List<Task> build() {
    onWatchTasks();

    return db.onGetTasks();
  }

  void onWatchTasks() {
    db.onStreamTasks().listen((tasks) {
      state = tasks;
    });
  }
}
