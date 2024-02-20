import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SleepModeCard extends StatelessWidget {
  const SleepModeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      child: BaseCard(
        height: spacing(20),
        content: BaseSpacingContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: space(
                  [
                    Text(
                      'Chế độ ngủ',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Chọn thời gian thức dậy tốt nhất',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.hintColor,
                      ),
                    ),
                  ],
                  height: spacing(),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Khám phá ngay'),
                ),
              )
            ],
          ),
        ),
        image: const AssetImage('assets/images/forest-moonlight.png'),
      ),
    );
  }
}
