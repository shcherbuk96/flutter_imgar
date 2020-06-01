import 'package:json_annotation/json_annotation.dart';

part 'companies_model.g.dart';

@JsonSerializable()
class Companies {
  String title;
  String id;
  Companies({this.title, this.id});
  
  factory Companies.fromJson(Map<String, dynamic> json) =>
      _$CompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$CompaniesToJson(this);
}
