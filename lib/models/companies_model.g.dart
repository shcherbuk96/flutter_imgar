// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Companies _$CompaniesFromJson(Map<String, dynamic> json) {
  return Companies(
    title: json['title'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$CompaniesToJson(Companies instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
    };
