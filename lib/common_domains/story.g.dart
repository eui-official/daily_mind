// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Story _$$_StoryFromJson(Map<String, dynamic> json) => _$_Story(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      source: json['source'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_StoryToJson(_$_Story instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'name': instance.name,
      'image': instance.image,
      'source': instance.source,
      'category': instance.category,
    };
