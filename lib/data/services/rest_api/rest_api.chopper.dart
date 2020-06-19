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
      'x-rapidapi-key': '1a54c9dcedmsh1767de492b741c6p15a25ejsn85ae2285542f'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<ResponseData, ResponseData>($request);
  }

  @override
  Future<Response<FilmResponse>> getDetailFilm(String idFilm) {
    final $url =
        'https://imdb-internet-movie-database-unofficial.p.rapidapi.com/film/$idFilm';
    final $headers = {
      'x-rapidapi-key': '1a54c9dcedmsh1767de492b741c6p15a25ejsn85ae2285542f',
      'useQueryString': 'true'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<FilmResponse, FilmResponse>($request);
  }
}
