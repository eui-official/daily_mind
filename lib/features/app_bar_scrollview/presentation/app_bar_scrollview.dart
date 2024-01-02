import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class AppBarScrollview extends StatelessWidget {
  final double? expandedHeight;
  final List<Widget> children;
  final PreferredSizeWidget? bottom;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final String title;
  final Widget? flexibleSpace;

  const AppBarScrollview({
    super.key,
    required this.children,
    required this.title,
    this.bottom,
    this.expandedHeight,
    this.flexibleSpace,
    this.physics,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
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
          expandedHeight: expandedHeight ?? kToolbarHeight,
          flexibleSpace: flexibleSpace,
          centerTitle: false,
          floating: true,
          forceMaterialTransparency: true,
          snap: true,
        ),
        SliverSafeArea(
          sliver: SliverPadding(
            padding: const EdgeInsets.only(
              bottom: kBottomNavigationBarHeight * 2,
            ),
            sliver: SliverList(delegate: SliverChildListDelegate(children)),
          ),
        ),
      ],
    );
  }
}
