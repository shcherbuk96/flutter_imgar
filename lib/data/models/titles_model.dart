import 'package:json_annotation/json_annotation.dart';

part 'titles_model.g.dart';

@JsonSerializable()
class Titles {
  String title;
  String image;
  String id;

  Titles({this.title, this.image, this.id});

  factory Titles.fromJson(Map<String, dynamic> json) => _$TitlesFromJson(json);

  Map<String, dynamic> toJson() => _$TitlesToJson(this);
}
