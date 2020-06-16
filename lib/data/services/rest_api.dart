import 'package:chopper/chopper.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/data/models/list_response.dart';
import 'package:imgar/data/services/custom_converter.dart';

part 'rest_api.chopper.dart';

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
