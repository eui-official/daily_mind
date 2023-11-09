enum FocusModeSessionSteps {
  ready,
  focusing,
  breakTime,
  finish,
}

const pomodoroSessionMaxSeconds = 10;

const tick = Duration(seconds: 1);
