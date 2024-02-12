import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlaylistAdd extends HookWidget {
  final VoidCallback onOpenPlaylist;

  const OnlinePlaylistAdd({
    super.key,
    required this.onOpenPlaylist,
  });

  @override
  Widget build(BuildContext context) {
    return BaseIconButtonWithTitle(
      onPressed: onOpenPlaylist,
      iconData: Icons.playlist_add_rounded,
    );
  }
}
