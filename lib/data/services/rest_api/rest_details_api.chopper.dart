// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_details_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$RestDetailsClient extends RestDetailsClient {
  _$RestDetailsClient([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestDetailsClient;

  @override
  Future<Response<DetailsFilm>> getDetailsFilm(String tconst) {
    final $url = 'https://imdb8.p.rapidapi.com/title/get-details';
    final $params = <String, dynamic>{'tconst': tconst};
    final $headers = {
      'x-rapidapi-key': '1a54c9dcedmsh1767de492b741c6p15a25ejsn85ae2285542f',
      'useQueryString': 'true'
    };
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<DetailsFilm, DetailsFilm>($request);
  }
}
