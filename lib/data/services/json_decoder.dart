import 'package:imgar/data/models/details_film/response_details_film.dart';
import 'package:imgar/data/models/film_response/film_response.dart';
import 'package:imgar/data/models/search_response/list_response.dart';
import 'package:imgar/data/services/custom_converter.dart';

final jsonDecoder = CustomJsonDecoder({
  ResponseData: ResponseData.fromJsonFactory,
  DetailsFilm: DetailsFilm.fromJsonFactory,
  FilmResponse: FilmResponse.fromJsonFactory
});
