import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_icon/presentation/dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineItemDropdownActions extends HookConsumerWidget {
  final Audio audio;
  final VoidCallback onOpenPlaylist;

  const OnlineItemDropdownActions({
    super.key,
    required this.audio,
    required this.onOpenPlaylist,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configNotifierProvider);

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
        if (fromSource != null)
          PopupMenuItem(
            child: Text('Từ ${fromSource.name}'),
          ),
        PopupMenuItem(
          onTap: onOpenPlaylist,
          child: Text('Thêm vào playlist'.tr()),
        )
      ],
      child: const DropdownIcon(),
    );
  }
}
