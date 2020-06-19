import 'package:json_annotation/json_annotation.dart';

part 'name_model.g.dart';

@JsonSerializable()
class Name {
  String title;
  String image;
  String id;

  Name({this.title, this.image, this.id});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
