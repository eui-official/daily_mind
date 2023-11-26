// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      createdAt: json['created_at'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      layout: json['layout'] as String,
      name: json['name'] as String,
      group: json['group'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'description': instance.description,
      'id': instance.id,
      'image': instance.image,
      'layout': instance.layout,
      'name': instance.name,
      'group': instance.group,
    };
