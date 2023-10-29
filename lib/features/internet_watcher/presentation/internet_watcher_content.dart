import 'package:daily_mind/common_widgets/base_circular_indicator.dart';
import 'package:daily_mind/common_widgets/base_marquee.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class InternetWatcherContent extends StatelessWidget {
  const InternetWatcherContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.theme.colorScheme.background,
            context.theme.colorScheme.background.withOpacity(0.9),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: space(
            [
              const Flexible(child: BaseCircularIndicator(size: 4)),
              SizedBox(
                height: spacing(3),
                child: const BaseMarquee(text: 'Không có kết nối'),
              ),
            ],
            height: spacing(2),
          ),
        ),
      ),
    );
  }
}
