import 'package:json_annotation/json_annotation.dart';

part 'names_model.g.dart';

@JsonSerializable()
class Names {
  String title;
  String image;
  String id;

  Names({this.title, this.image, this.id});

  factory Names.fromJson(Map<String, dynamic> json) => _$NamesFromJson(json);

  Map<String, dynamic> toJson() => _$NamesToJson(this);
}
