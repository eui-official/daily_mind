import 'package:daily_mind/features/app_logo/presentation/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class AppBarScrollview extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const AppBarScrollview({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const AppLogo(),
          title: Text(title),
          expandedHeight: context.height * 0.2,
          forceMaterialTransparency: true,
        ),
        SliverList(delegate: SliverChildListDelegate(children)),
      ],
    );
  }
}
