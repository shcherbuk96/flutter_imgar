import 'package:imgar/models/companies_model.dart';
import 'package:imgar/models/names_model.dart';
import 'package:imgar/models/titles_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable()
class ResponseData {
  List<Titles> titles;
  List<Names> names;
  List<Companies> companies;

  ResponseData({this.titles, this.names, this.companies});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
