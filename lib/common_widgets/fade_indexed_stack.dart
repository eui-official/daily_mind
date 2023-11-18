import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';

class FadeIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const FadeIndexedStack({
    super.key,
    required this.index,
    required this.children,
    this.duration = defaultDuration,
  });

  @override
  FadeIndexedStackState createState() => FadeIndexedStackState();
}

class FadeIndexedStackState extends State<FadeIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void didUpdateWidget(FadeIndexedStack oldWidget) {
    if (widget.index != oldWidget.index) {
      controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: IndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}
