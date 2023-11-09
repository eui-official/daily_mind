enum FocusModeSessionSteps {
  none,
  ready,
  running,
  breakTime,
  finish,
}

const pomodoroSessionSeconds = 1500;

const tick = Duration(seconds: 1);
