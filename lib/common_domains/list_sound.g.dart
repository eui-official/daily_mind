// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_sound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListSound _$$_ListSoundFromJson(Map<String, dynamic> json) => _$_ListSound(
      sounds: (json['sounds'] as List<dynamic>)
          .map((e) => Sound.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListSoundToJson(_$_ListSound instance) =>
    <String, dynamic>{
      'sounds': instance.sounds,
    };
