// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_online_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoundOnlineItemImpl _$$SoundOnlineItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SoundOnlineItemImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      source: json['source'] as String,
      soundType: json['sound_type'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$SoundOnlineItemImplToJson(
        _$SoundOnlineItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'name': instance.name,
      'image': instance.image,
      'source': instance.source,
      'sound_type': instance.soundType,
      'category': instance.category,
    };
