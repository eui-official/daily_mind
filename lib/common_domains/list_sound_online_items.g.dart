// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_sound_online_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListSoundOnlineItems _$$_ListSoundOnlineItemsFromJson(
        Map<String, dynamic> json) =>
    _$_ListSoundOnlineItems(
      soundOnlineItems: (json['soundOnlineItems'] as List<dynamic>)
          .map((e) => SoundOnlineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListSoundOnlineItemsToJson(
        _$_ListSoundOnlineItems instance) =>
    <String, dynamic>{
      'soundOnlineItems': instance.soundOnlineItems,
    };
