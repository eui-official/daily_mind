import 'package:daily_mind/constants/sound_items.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SoundIconsStack extends StatelessWidget {
  final List<String> ids;
  final double iconSize;

  const SoundIconsStack({
    super.key,
    required this.ids,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: ids.map(
        (id) {
          final soundItem =
              soundOfflineItems.firstWhere((item) => item.id == id);
          final index = ids.indexOf(id);

          return Container(
            margin: EdgeInsets.only(right: index * spacing(iconSize / 2)),
            child: Container(
              height: spacing(iconSize),
              width: spacing(iconSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
                boxShadow: kElevationToShadow[4],
                image: DecorationImage(
                  image: AssetImage(soundItem.image),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
