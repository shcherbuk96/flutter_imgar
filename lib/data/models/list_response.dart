import 'package:imgar/data/models/companie_model.dart';
import 'package:imgar/data/models/name_model.dart';
import 'package:imgar/data/models/title_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable()
class ResponseData {
  @JsonKey(defaultValue: [])
  List<Title> titles;
  @JsonKey(defaultValue: [])
  List<Name> names;
  @JsonKey(defaultValue: [])
  List<Companie> companies;

  ResponseData({this.titles, this.names, this.companies});

  static const fromJsonFactory = _$ResponseDataFromJson;

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
