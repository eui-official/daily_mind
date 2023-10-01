import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:daily_mind/features/story_card/presentation/story_card_image.dart';
import 'package:daily_mind/features/story_card/presentation/story_card_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoryCard extends HookConsumerWidget {
  final Category category;
  final Story story;

  const StoryCard({
    super.key,
    required this.category,
    required this.story,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyCardNotifier = ref.read(storyCardProvider.notifier);
    final miniPlayerNotifier = ref.read(miniPlayerProvider.notifier);

    final onTap = useCallback(() {
      storyCardNotifier.onPlayStory(story);
      miniPlayerNotifier.onUpdateState(
        MiniPlayerState(
          isShow: true,
          image: StoryCardImage(image: story.image),
          title: story.name,
          networkType: NetworkType.online,
          onPressed: () {},
        ),
      );
    }, [story]);

    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: spacing(8),
        height: spacing(6),
        child: BaseNetworkImage(image: story.image),
      ),
      title: Text(
        story.name,
        style: context.textTheme.bodyMedium,
      ),
    );
  }
}
