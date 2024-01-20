// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioImpl _$$AudioImplFromJson(Map<String, dynamic> json) => _$AudioImpl(
      createdAt: json['created_at'] as String,
      category: json['category'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      source: json['source'] as String,
      description: json['description'] as String?,
      artist: json['artist'] as String?,
      fromSource: json['from_source'] as String?,
    );

Map<String, dynamic> _$$AudioImplToJson(_$AudioImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'category': instance.category,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'source': instance.source,
      'description': instance.description,
      'artist': instance.artist,
      'from_source': instance.fromSource,
    };
