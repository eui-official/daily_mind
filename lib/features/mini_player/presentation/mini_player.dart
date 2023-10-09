import 'package:daily_mind/common_widgets/base_marquee.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_toggle_button.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class MiniPlayer extends HookConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final miniPlayerState = ref.watch(miniPlayerProvider);
    final processingStateSnapshot =
        useStream(miniPlayerState.processingStateStream);

    final isLoading = processingStateSnapshot.data != ProcessingState.ready;

    return Container(
      margin: EdgeInsets.all(spacing(2)),
      child: Material(
        child: InkWell(
          onTap: miniPlayerState.onPressed,
          borderRadius: BorderRadius.circular(spacing()),
          child: Container(
            height: spacing(8),
            padding: EdgeInsets.symmetric(horizontal: spacing()),
            decoration: BoxDecoration(
              color: context.theme.focusColor,
              borderRadius: BorderRadius.circular(spacing()),
            ),
            child: Row(
              children: space([
                miniPlayerState.image,
                if (miniPlayerState.title.isNotEmpty)
                  Flexible(
                    child: BaseMarquee(
                      text: miniPlayerState.title,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                MiniPlayerToggleButton(isLoading: isLoading),
              ], width: spacing(2)),
            ),
          ),
        ),
      ),
    );
  }
}
