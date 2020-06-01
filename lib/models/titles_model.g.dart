// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Titles _$TitlesFromJson(Map<String, dynamic> json) {
  return Titles(
    title: json['title'] as String,
    image: json['image'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$TitlesToJson(Titles instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'id': instance.id,
    };
