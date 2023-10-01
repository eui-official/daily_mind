import 'package:daily_mind/features/disk_player/presentation/disk_player.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BasePlayerControl extends StatelessWidget {
  final String image;
  final bool isPlaying;
  final Widget child;
  final ScrollController? scrollController;

  const BasePlayerControl({
    super.key,
    required this.image,
    required this.isPlaying,
    required this.child,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBackground(
          image: image,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: DiskPlayer(
                  image: image,
                  isPlaying: isPlaying,
                ),
                expandedHeight: context.height / 2,
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: kToolbarHeight),
                sliver: SliverToBoxAdapter(child: child),
              )
            ],
          ),
        ),
      ],
    );
  }
}
