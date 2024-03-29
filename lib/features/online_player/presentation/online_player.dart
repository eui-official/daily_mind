import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:daily_mind/features/online_player_details/presentation/online_player_details.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayer extends HookConsumerWidget {
  final ScrollController scrollController;

  const OnlinePlayer({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final onlinePlayerNotifier =
        ref.read(onlinePlayerNotifierProvider.notifier);
    final onlinePlayer = baseBackgroundHandler.onlinePlayer;

    final currentIndexSnapshot = useStream(onlinePlayer.currentIndexStream);
    final currentIndex = currentIndexSnapshot.data ?? 0;

    final sequenceSnapshot = useStream(onlinePlayer.sequenceStream);
    final sequence = sequenceSnapshot.data ?? [];

    final child = useMemoized(() {
      if (sequence.isEmpty) {
        return kEmptyWidget;
      }

      final s = sequence[currentIndex];
      final tag = s.tag;

      return OnlinePlayerDetails(
        onExpanded: onlinePlayerNotifier.onToggleExpanded,
        scrollController: scrollController,
        audio: tag,
        child: OnlinePlayerBottom(audio: tag),
      );
    }, [sequence, currentIndex]);

    return BaseAnimatedSwitcher(child: child);
  }
}
