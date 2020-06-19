import 'package:imgar/data/models/film_response/cast.dart';
import 'package:imgar/data/models/film_response/trailer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film_response.g.dart';

@JsonSerializable()
class FilmResponse {
  String id;
  String title;
  String year;
  String length;
  String rating;
  String ratingVotes;
  String poster;
  String plot;
  Trailer trailer;
  List<Cast> cast;
  List<List> technicalSpecs;

  FilmResponse(
      {this.id,
      this.title,
      this.year,
      this.length,
      this.rating,
      this.ratingVotes,
      this.poster,
      this.plot,
      this.trailer,
      this.cast,
      this.technicalSpecs});

  static const fromJsonFactory = _$FilmResponseFromJson;

  factory FilmResponse.fromJson(Map<String, dynamic> json) =>
      _$FilmResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FilmResponseToJson(this);
}
