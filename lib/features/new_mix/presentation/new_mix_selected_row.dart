import 'package:daily_mind/features/list_sounds/constant/sound_items.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewMixSelectedRow extends HookConsumerWidget {
  const NewMixSelectedRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedState = ref.watch(newMixSelectedProvider);
    final selectedIds = newMixSelectedState.selectedIds;

    return Material(
      borderRadius: BorderRadius.circular(context.width),
      color: Colors.white12,
      child: InkWell(
        borderRadius: BorderRadius.circular(context.width),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(spacing()),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: selectedIds.map(
              (id) {
                final soundItem =
                    soundItems.firstWhere((item) => item.id == id);
                final index = selectedIds.indexOf(id);

                return Container(
                  margin: EdgeInsets.only(right: index * spacing(1.5)),
                  child: Container(
                    height: spacing(3),
                    width: spacing(3),
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
          ),
        ),
      ),
    );
  }
}
