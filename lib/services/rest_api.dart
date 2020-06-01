import 'package:dio/dio.dart';
import 'package:imgar/models/list_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

const String urlApi =
    "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/search/";

@RestApi(baseUrl: urlApi)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("{film}")
  Future<ResponseData> getFilms(@Path("film") String film);
  
}