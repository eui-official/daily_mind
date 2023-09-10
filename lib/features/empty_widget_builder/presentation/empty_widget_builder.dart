import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/types/commom.dart';
import 'package:flutter/material.dart';

class EmptyWidgetBuilder<T> extends StatelessWidget {
  final T? data;
  final OnEmptyWidgetBuilder<T> builder;
  final Widget empty;

  const EmptyWidgetBuilder({
    super.key,
    required this.builder,
    this.data,
    this.empty = emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    final checkedData = data;

    if (checkedData != null) {
      return builder(checkedData);
    }

    return empty;
  }
}
