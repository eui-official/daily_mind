import 'package:daily_mind/common_widgets/base_list_sound_online_builder.dart';
import 'package:daily_mind/features/list_sound_online/presentation/base_list_sound_online.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class ListSoundLive extends HookWidget {
  const ListSoundLive({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseListSoundOnlineBuilder(
      queryBuilder: supabase.from('sounds').select().eq('category', 1),
      onListSoundBuilder: (context, listSound) {
        return BaseListSoundOnline(
          items: listSound,
          onDeleted: (int value) {},
          onSelected: (int value) {},
          selectedIds: const [],
          title: 'Live',
        );
      },
    );
  }
}
