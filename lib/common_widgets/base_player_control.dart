import 'package:daily_mind/features/disk_player/presentation/disk_player.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:flutter/material.dart';

class BasePlayerControl extends StatelessWidget {
  final PreferredSizeWidget? preferredSizeWidget;
  final String image;
  final bool isPlaying;
  final ScrollableWidgetBuilder bottomChildBuilder;

  const BasePlayerControl({
    super.key,
    required this.image,
    required this.isPlaying,
    required this.bottomChildBuilder,
    this.preferredSizeWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: preferredSizeWidget,
      body: Stack(
        children: [
          StackBackground(
            image: image,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DiskPlayer(
                  image: image,
                  isPlaying: isPlaying,
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            maxChildSize: 0.75,
            builder: bottomChildBuilder,
          ),
        ],
      ),
    );
  }
}
