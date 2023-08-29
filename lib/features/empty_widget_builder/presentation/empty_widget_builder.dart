import 'package:daily_mind/types/commom.dart';
import 'package:flutter/material.dart';

class EmptyWidgetBuilder<T> extends StatelessWidget {
  final T? data;
  final OnEmptyWidgetBuilder<T> builder;

  const EmptyWidgetBuilder({
    super.key,
    this.data,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final checkedData = data;

    if (checkedData != null) {
      return builder(checkedData);
    }

    return const SizedBox.shrink();
  }
}
