import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class FocusModeDeleteSliable extends StatelessWidget {
  final int id;
  final Widget child;
  final VoidCallback onDeleted;

  const FocusModeDeleteSliable({
    super.key,
    required this.id,
    required this.child,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(id),
      endActionPane: ActionPane(
        extentRatio: 0.25,
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
    );
  }
}
