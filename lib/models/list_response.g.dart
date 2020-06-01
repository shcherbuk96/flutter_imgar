// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData(
    titles: (json['titles'] as List)
        ?.map((e) =>
            e == null ? null : Titles.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    names: (json['names'] as List)
        ?.map(
            (e) => e == null ? null : Names.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    companies: (json['companies'] as List)
        ?.map((e) =>
            e == null ? null : Companies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'titles': instance.titles,
      'names': instance.names,
      'companies': instance.companies,
    };
