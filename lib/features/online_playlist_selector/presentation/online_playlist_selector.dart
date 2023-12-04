import 'package:daily_mind/features/online_playlist_selector/presentation/online_playlist_selector_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlaylistSelector extends HookWidget {
  final ValueChanged<int> onSelected;

  const OnlinePlaylistSelector({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return OnlinePlaylistSelectorContent(onSelected: onSelected);
  }
}
