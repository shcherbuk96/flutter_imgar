// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$RestClient extends RestClient {
  _$RestClient([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestClient;

  @override
  Future<Response<ResponseData>> getFilms(String film) {
    final $url =
        'https://imdb-internet-movie-database-unofficial.p.rapidapi.com/search/$film';
    final $headers = {
      'x-rapidapi-key': '9d2579bf43msh8b138883cc45695p1254cejsn4af7ec1ce4fc'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<ResponseData, ResponseData>($request);
  }
}
