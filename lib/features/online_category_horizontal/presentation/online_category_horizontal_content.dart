import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/common_widgets/base_icon/presentation/play.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineCategoryHorizontalContent extends StatelessWidget {
  final String name;
  final String description;

  const OnlineCategoryHorizontalContent({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      child: Row(
        children: space(
          [
            Flexible(
              child: BaseHeaderWithDescription(
                name: name,
                description: description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const PlayIcon(),
          ],
          width: spacing(2),
        ),
      ),
    );
  }
}
