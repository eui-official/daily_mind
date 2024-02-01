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
  final List<Widget> actions;

  const AppBarScrollview({
    super.key,
    required this.children,
    required this.title,
    this.actions = const [],
    this.bottom,
    this.expandedHeight,
    this.flexibleSpace,
    this.physics,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: CustomScrollView(
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
            actions: actions,
            bottom: bottom,
            expandedHeight: expandedHeight ?? kToolbarHeight,
            flexibleSpace: flexibleSpace,
            centerTitle: false,
            forceMaterialTransparency: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: kToolbarHeight / 2,
              bottom: kBottomNavigationBarHeight * 2,
            ),
            sliver: SliverList(delegate: SliverChildListDelegate(children)),
          ),
        ],
      ),
    );
  }
}
