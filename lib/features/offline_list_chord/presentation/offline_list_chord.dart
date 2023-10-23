import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_mind/common_widgets/base_circular_indicator.dart';
import 'package:daily_mind/features/offline_list_chord_item/presentation/offline_list_chord_item.dart';
import 'package:daily_mind/features/offline_list_chord/presentation/offline_list_chore_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListChord extends HookConsumerWidget {
  const OfflineListChord({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offlineListChoreState = ref.watch(offlineListChoreProvider);
    final playlists = offlineListChoreState.playlists;

    if (offlineListChoreState.isLoading) {
      return const BaseCircularIndicator();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: spacing(4)),
          child: CarouselSlider.builder(
            itemCount: playlists.length,
            options: CarouselOptions(
              aspectRatio: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            itemBuilder: (context, index, realIndex) {
              final playlist = playlists[index];

              return OfflineListChordItem(
                key: ValueKey(playlist.id),
                playlist: playlist,
              );
            },
          ),
        );
      },
    );
  }
}
