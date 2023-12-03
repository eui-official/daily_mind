import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseTabbar extends StatelessWidget {
  final TabController tabController;
  final ValueChanged<int> onTap;
  final List<Widget> tabs;

  const BaseTabbar({
    super.key,
    required this.tabController,
    required this.onTap,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      isScrollable: true,
      onTap: onTap,
      tabAlignment: TabAlignment.start,
      splashBorderRadius: circularRadius(2),
      indicator: BoxDecoration(
        borderRadius: circularRadius(2),
        color: context.theme.splashColor,
      ),
      tabs: tabs,
    );
  }
}
