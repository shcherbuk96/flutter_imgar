import 'package:imgar/data/models/companies_model.dart';
import 'package:imgar/data/models/names_model.dart';
import 'package:imgar/data/models/titles_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable()
class ResponseData {
  @JsonKey(defaultValue: [])
  List<Titles> titles;
  @JsonKey(defaultValue: [])
  List<Names> names;
  @JsonKey(defaultValue: [])
  List<Companies> companies;

  ResponseData({this.titles, this.names, this.companies});

  static const fromJsonFactory = _$ResponseDataFromJson;

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
