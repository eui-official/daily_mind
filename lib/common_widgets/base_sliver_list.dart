import 'package:flutter/material.dart';

class BaseSliverList extends StatelessWidget {
  final ScrollController? scrollController;
  final List<Widget> children;

  const BaseSliverList({
    super.key,
    required this.scrollController,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(children),
        ),
      ],
    );
  }
}
