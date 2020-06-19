import 'package:imgar/data/models/details_film/image_details_film.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_details_film.g.dart';

@JsonSerializable()
class DetailsFilm {
  @JsonKey(defaultValue: "")
  String type;
  @JsonKey(defaultValue: "")
  String id;
  ImageDetailsFilm image;
  @JsonKey(defaultValue: 0)
  int runningTimeInMinutes;
  @JsonKey(defaultValue: "")
  String nextEpisode;
  @JsonKey(defaultValue: 0)
  int numberOfEpisodes;
  @JsonKey(defaultValue: 0)
  int seriesEndYear;
  @JsonKey(defaultValue: 0)
  int seriesStartYear;
  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String titleType;
  @JsonKey(defaultValue: 0)
  int year;

  DetailsFilm(
      {this.type,
      this.id,
      this.image,
      this.runningTimeInMinutes,
      this.nextEpisode,
      this.numberOfEpisodes,
      this.seriesEndYear,
      this.seriesStartYear,
      this.title,
      this.titleType,
      this.year});

  static const fromJsonFactory = _$DetailsFilmFromJson;

  factory DetailsFilm.fromJson(Map<String, dynamic> json) =>
      _$DetailsFilmFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsFilmToJson(this);
}
