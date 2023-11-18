import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class AppBarScrollview extends StatelessWidget {
  final List<Widget> children;
  final PreferredSizeWidget? bottom;
  final ScrollPhysics? physics;
  final String title;

  const AppBarScrollview({
    super.key,
    required this.children,
    required this.title,
    this.bottom,
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
            bottom: bottom,
            centerTitle: false,
            expandedHeight: kToolbarHeight * 2,
            flexibleSpace: Container().blurred(colorOpacity: 0),
            floating: true,
            forceMaterialTransparency: true,
            snap: true,
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
