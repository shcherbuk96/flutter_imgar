import 'package:json_annotation/json_annotation.dart';

part 'companie_model.g.dart';

@JsonSerializable()
class Companie {
  String title;
  String id;
  Companie({this.title, this.id});

  factory Companie.fromJson(Map<String, dynamic> json) =>
      _$CompanieFromJson(json);

  Map<String, dynamic> toJson() => _$CompanieToJson(this);
}
