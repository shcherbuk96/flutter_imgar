// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'names_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Names _$NamesFromJson(Map<String, dynamic> json) {
  return Names(
    title: json['title'] as String,
    image: json['image'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$NamesToJson(Names instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'id': instance.id,
    };
