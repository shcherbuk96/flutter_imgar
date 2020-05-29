import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Companies {
  String title;
  Null image;
  String id;

  Companies({this.title, this.image, this.id});

  Companies.fromJson(Map<String, dynamic> json) {
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
