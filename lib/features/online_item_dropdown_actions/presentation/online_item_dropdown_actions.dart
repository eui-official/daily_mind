import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineItemDropdownActions extends HookConsumerWidget {
  final Audio audio;

  const OnlineItemDropdownActions({
    super.key,
    required this.audio,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configProvider);

    final fromSource = useMemoized(
      () {
        return configState.fromSources.firstWhereOrNull(
          (f) => f.id == audio.fromSource,
        );
      },
      [configState, audio],
    );

    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        if (fromSource != null) PopupMenuItem(child: Text(fromSource.name)),
      ],
      child: const Icon(Icons.more_vert),
    );
  }
}
