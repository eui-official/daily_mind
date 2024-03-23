import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class AppBarScrollview extends HookWidget {
  final double? expandedHeight;
  final List<Widget> children;
  final PreferredSizeWidget? bottom;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final String title;
  final Widget? flexibleSpace;
  final List<Widget> actions;
  final bool useSafeArea;

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
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = useMemoized(() {
      return CustomScrollView(
        controller: scrollController,
        physics: physics,
        slivers: [
          SliverAppBar(
            title: Text(
              title,
              style: context.textTheme.headlineMedium?.copyWith(
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
      );
    }, [
      scrollController,
      physics,
      actions,
      bottom,
      expandedHeight,
      flexibleSpace,
      title,
      children,
    ]);

    final child = useMemoized(() {
      return useSafeArea
          ? SafeArea(
              maintainBottomViewPadding: true,
              child: content,
            )
          : content;
    }, [useSafeArea, content]);

    return child;
  }
}
