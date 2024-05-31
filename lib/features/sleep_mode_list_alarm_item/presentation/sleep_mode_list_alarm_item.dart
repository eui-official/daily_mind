import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/db/schemas/alarm_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class SleepModeListAlarmItem extends HookWidget {
  final AlarmHistory alarmHistory;
  final ValueChanged<AlarmHistory> onTap;
  final ValueChanged<AlarmHistory> onStartAlarmHistory;
  final ValueChanged<AlarmHistory> onStopAlarmHistory;
  final int? selectedId;

  const SleepModeListAlarmItem({
    super.key,
    required this.alarmHistory,
    required this.onStartAlarmHistory,
    required this.onStopAlarmHistory,
    required this.onTap,
    this.selectedId,
  });

  @override
  Widget build(BuildContext context) {
    final endTime = alarmHistory.endTime;
    final isSelected = alarmHistory.id == selectedId;

    final onChanged = useCallback(
      (bool isChecked) {
        if (isChecked) {
          onStartAlarmHistory(alarmHistory);
        } else {
          onStopAlarmHistory(alarmHistory);
        }
      },
      [alarmHistory, onStartAlarmHistory, onStopAlarmHistory],
    );

    return BaseNullBuilder(
      value: endTime,
      builder: (value) {
        return ListTile(
          onTap: () => onTap(alarmHistory),
          title: Text(
            dateFormatter.onFormatTime24h(value),
            style: context.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Switch(
            value: isSelected,
            onChanged: onChanged,
          ),
        );
      },
    );
  }
}
