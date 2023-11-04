// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_sound_online_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListSoundOnlineItemsImpl _$$ListSoundOnlineItemsImplFromJson(
        Map<String, dynamic> json) =>
    _$ListSoundOnlineItemsImpl(
      soundOnlineItems: (json['soundOnlineItems'] as List<dynamic>)
          .map((e) => SoundOnlineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListSoundOnlineItemsImplToJson(
        _$ListSoundOnlineItemsImpl instance) =>
    <String, dynamic>{
      'soundOnlineItems': instance.soundOnlineItems,
    };
