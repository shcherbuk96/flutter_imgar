import 'package:chopper/chopper.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/data/models/details_film/response_details_film.dart';
import 'package:imgar/data/services/custom_converter.dart';

part 'rest_details_api.chopper.dart';

@ChopperApi(baseUrl: urlApiDetailsFilm)
abstract class RestDetailsClient extends ChopperService {
  @Get(headers: {headerKeyName: headerKeyValue, "useQueryString": "true"})
  Future<Response<DetailsFilm>> getDetailsFilm(@Query('tconst') String tconst);

  static RestDetailsClient createDetailsFilm() {
    final client = ChopperClient(
        baseUrl: urlApiDetailsFilm,
        services: [_$RestDetailsClient()],
        converter: JsonSerializableConverter());
    return _$RestDetailsClient(client);
  }
}
