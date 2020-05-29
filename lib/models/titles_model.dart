import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Titles {
  String title;
  String image;
  String id;

  Titles({this.title, this.image, this.id});

  Titles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
