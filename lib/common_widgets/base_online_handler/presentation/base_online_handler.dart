import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseOnlineHandler extends HookConsumerWidget {
  final AudioCategory audioCategory;
  final EdgeInsets? padding;
  final OnFunctionHandlerBuilder builder;

  const BaseOnlineHandler({
    super.key,
    required this.audioCategory,
    required this.builder,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final onlinePlayerNotifier = ref.read(onlinePlayerProvider.notifier);
    final onlinePlayerState = ref.watch(onlinePlayerProvider);

    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);
    final audios = audioCategory.audios;
    final category = audioCategory.category;

    final onTap = useCallback(() async {
      onlinePlayerNotifier.onUpdateId(category.id);
      onlinePlayerNotifier.onUpdateTitle(category.name);
      onlinePlayerNotifier.onUpdateDescription(category.description);

      await baseBackgroundHandler.onInitOnline(audios);

      baseMiniPlayerNotifier.onUpdateState(
        const MiniPlayerState(
          isShow: true,
          audioType: AudioTypes.online,
        ),
      );
    }, [
      audios,
      category,
      onlinePlayerState,
    ]);

    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: spacing(2)),
      child: builder(onTap),
    );
  }
}
