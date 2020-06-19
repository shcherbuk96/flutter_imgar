import 'package:json_annotation/json_annotation.dart';

part 'image_details_film.g.dart';

@JsonSerializable()
class ImageDetailsFilm {
  @JsonKey(defaultValue: 0)
  int height;
  @JsonKey(defaultValue: "")
  String id;
  @JsonKey(defaultValue: "")
  String url;
  @JsonKey(defaultValue: 0)
  int width;

  ImageDetailsFilm({this.height, this.id, this.url, this.width});

  static const fromJsonFactory = _$ImageDetailsFilmFromJson;

  factory ImageDetailsFilm.fromJson(Map<String, dynamic> json) =>
      _$ImageDetailsFilmFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDetailsFilmToJson(this);
}
