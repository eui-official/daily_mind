import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemDismissible extends StatelessWidget {
  final Widget child;
  final List<Widget> endActionPaneChildren;
  final Widget? dismissible;

  const ItemDismissible({
    super.key,
    required this.child,
    this.dismissible,
    this.endActionPaneChildren = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: dismissible,
        children: endActionPaneChildren,
      ),
      child: child,
    );
  }
}
