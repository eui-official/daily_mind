import 'package:daily_mind/common_widgets/base_player_header_actions.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseStackWithActions extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final ScrollController? scrollController;
  final Widget background;

  const BaseStackWithActions({
    super.key,
    required this.background,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background,
        BaseSpacingContainer(
          margin: const EdgeInsets.symmetric(vertical: kToolbarHeight),
          padding: EdgeInsets.symmetric(horizontal: spacing(2)),
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: kToolbarHeight),
                child: const BasePlayerHeaderActions(),
              ),
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}
