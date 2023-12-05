import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class BaseSliable extends StatelessWidget {
  final int id;
  final Widget child;
  final VoidCallback onDeleted;

  const BaseSliable({
    super.key,
    required this.id,
    required this.child,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: circularRadius(2),
      child: Slidable(
        key: ValueKey(id),
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: onDeleted),
          children: [
            SlidableAction(
              backgroundColor: context.theme.colorScheme.error,
              onPressed: (context) => onDeleted(),
              icon: Icons.close,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
