import 'package:daily_mind/common_widgets/base_circular_indicator.dart';
import 'package:daily_mind/features/empty_list_mix/presentation/empty_list_mix.dart';
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

    if (playlists.isEmpty) {
      return const EmptyListMix();
    }

    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: spacing(3)),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        final playlist = playlists[index];

        return OfflineListChordItem(
          key: ValueKey(playlist.id),
          playlist: playlist,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing(2));
      },
    );
  }
}
