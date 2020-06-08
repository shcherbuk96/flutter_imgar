import 'package:chopper/chopper.dart';
import 'package:imgar/data/models/list_response.dart';
import 'package:imgar/data/services/custom_converter.dart';

part 'rest_api.chopper.dart';

const String headerKeyValue =
    "9d2579bf43msh8b138883cc45695p1254cejsn4af7ec1ce4fc";
const String headerKeyName = "x-rapidapi-key";
const String urlApi =
    "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/search/";

@ChopperApi(baseUrl: urlApi)
abstract class RestClient extends ChopperService {
  @Get(headers: {headerKeyName: headerKeyValue}, path: 'film')
  Future<Response<ResponseData>> getFilms(@Path('film') String film);

  static RestClient create() {
    final client = ChopperClient(
        baseUrl: urlApi,
        services: [_$RestClient()],
        converter: JsonSerializableConverter());
    return _$RestClient(client);
  }
}
