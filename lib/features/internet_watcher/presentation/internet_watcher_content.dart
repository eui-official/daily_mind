import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InternetWatcherContent extends StatelessWidget {
  const InternetWatcherContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: spacing(2),
          vertical: spacing(3),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: BaseHeaderWithDescription(
                name: 'Không có kết nối internet',
                description:
                    'Điều này có thể gây ảnh hưởng đến trãi nghiệm của bạn',
                headerAction: IconButton(
                  onPressed: context.pop,
                  icon: const Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
