import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineListRelatedHeaderFrom extends HookConsumerWidget {
  const OnlineListRelatedHeaderFrom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlayerState = ref.watch(onlinePlayerNotifierProvider);
    final title = onlinePlayerState.title;

    final child = useMemoized(() {
      if (title != null) {
        return Text('Từ $title');
      }

      return kEmptyWidget;
    }, [title]);

    return BaseAnimatedSwitcher(child: child);
  }
}
