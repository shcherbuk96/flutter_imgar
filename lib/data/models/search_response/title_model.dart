import 'package:json_annotation/json_annotation.dart';

part 'title_model.g.dart';

@JsonSerializable()
class Title {
  static String table = 'title_items';
  String title;
  String image;
  String id;

  Title({this.title, this.image, this.id});

 Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'title': title, 'image': image};

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static Title fromMap(Map<String, dynamic> map) {
    return Title(id: map['id'], title: map['title'], image: map['image']);
  }

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}
