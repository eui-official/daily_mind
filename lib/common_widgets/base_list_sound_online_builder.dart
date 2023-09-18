import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BaseListSoundOnlineBuilder extends StatelessWidget {
  final PostgrestFilterBuilder<dynamic> queryBuilder;
  final OnListSoundBuilder onListSoundBuilder;

  const BaseListSoundOnlineBuilder({
    super.key,
    required this.queryBuilder,
    required this.onListSoundBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: queryBuilder,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SoundOnlineItem> listSoundOnlineItem = [];
          final listSounds = snapshot.data as List<dynamic>;

          for (final sound in listSounds) {
            listSoundOnlineItem.add(SoundOnlineItem.fromJson(sound));
          }

          return onListSoundBuilder(
            context,
            listSoundOnlineItem,
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
