import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Names {
  String title;
  String image;
  String id;

  Names({this.title, this.image, this.id});

  Names.fromJson(Map<String, dynamic> json) {
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
