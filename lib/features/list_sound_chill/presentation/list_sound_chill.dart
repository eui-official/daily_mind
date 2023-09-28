import 'package:daily_mind/common_widgets/base_list_sound_online_builder.dart';
import 'package:daily_mind/features/list_sound_online/presentation/base_list_sound_online.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class ListSoundChill extends HookWidget {
  const ListSoundChill({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseListSoundOnlineBuilder(
      queryBuilder: supabase.from('sounds').select().eq(
            'category',
            'ac25d14e-a1f8-463a-9581-ee88526c04bd',
          ),
      onListItemBuilder: (context, listSound) {
        return BaseListSoundOnline(
          items: listSound,
          title: 'Chill',
        );
      },
    );
  }
}
