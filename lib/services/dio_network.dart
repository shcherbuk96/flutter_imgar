import 'package:dio/dio.dart';
import 'package:imgar/services/rest_api.dart';

String urlApi =
    "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/search/harrypotter";
String headerKeyValue = "9d2579bf43msh8b138883cc45695p1254cejsn4af7ec1ce4fc";
String headerKeyName = "x-rapidapi-key";

class DioNetworkService {
  var dio = Dio();

  DioNetworkService() {
    dio.options
      ..headers["x-rapidapi-key"] =
          "9d2579bf43msh8b138883cc45695p1254cejsn4af7ec1ce4fc"
      ..connectTimeout = 3000
      ;
  }

  RestClient restClient() => RestClient(dio);
}
