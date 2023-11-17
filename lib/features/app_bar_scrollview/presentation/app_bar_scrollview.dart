import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class AppBarScrollview extends StatelessWidget {
  final List<Widget> children;
  final ScrollPhysics? physics;
  final String title;

  const AppBarScrollview({
    super.key,
    required this.children,
    required this.title,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: physics,
        slivers: [
          SliverAppBar(
            title: Text(
              title,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            expandedHeight: kToolbarHeight * 2,
            forceMaterialTransparency: true,
            centerTitle: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              bottom: kBottomNavigationBarHeight * 2,
            ),
            sliver: SliverList(delegate: SliverChildListDelegate(children)),
          ),
        ],
      ),
    );
  }
}
