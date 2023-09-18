// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sound _$$_SoundFromJson(Map<String, dynamic> json) => _$_Sound(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      source: json['source'] as String,
      isLive: json['isLive'] as bool,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_SoundToJson(_$_Sound instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'name': instance.name,
      'image': instance.image,
      'source': instance.source,
      'isLive': instance.isLive,
      'category': instance.category,
    };
