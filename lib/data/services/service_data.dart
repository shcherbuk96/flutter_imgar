import 'package:imgar/data/models/about_film_model.dart';
import 'package:imgar/data/models/details_film/response_details_film.dart';
import 'package:imgar/data/models/film_response/film_response.dart';
import 'package:imgar/data/models/search_response/title_model.dart';
import 'package:imgar/data/services/database/db.dart';
import 'package:imgar/data/services/service_locator.dart';

class ServiceData {
  final chopperRestClient = createRestClient();
  final chopperRestDetailsClient = createRestDetailsClient();

  getInformationAboutFilm(String id) async {
    // DB.nameTable = id;
    // await DB.init();

    // if (getInformationAboutFilmFromDB(id) != null) {
    //   return await getInformationAboutFilmFromDB(id);
    // } else {
    final film = await getInformationAboutFilmFromApi(id);
    //saveInformationAboutFilmFToDB(film);
    return film;
    // }
  }

  getInformationAboutFilmFromApi(String id) async {
    FilmResponse filmResponse =
        await chopperRestClient.getDetailFilm(id).then((value) => value.body);

    DetailsFilm someDetailes = await chopperRestDetailsClient
        .getDetailsFilm(id)
        .then((value) => value.body);

    AboutFilm film = AboutFilm(
        filmResponse.id,
        someDetailes.titleType,
        filmResponse.title,
        filmResponse.poster,
        filmResponse.plot,
        filmResponse.length,
        someDetailes.year.toString(),
        filmResponse.rating,
        someDetailes.numberOfEpisodes.toString(),
        someDetailes.seriesStartYear.toString(),
        someDetailes.seriesEndYear.toString());

    return film;
  }

  getInformationAboutFilmFromDB(String id) async {
    List<Map<String, dynamic>> _results = await DB.query(id);
    final obj = _results.map((item) => AboutFilm.fromMap(item)).toList();
    return obj[0];
  }

  saveInformationAboutFilmFToDB(AboutFilm filmFromAPI) async {
    await DB.insert(filmFromAPI.id, filmFromAPI);
  }

  getFoundFilms(String query) async {
    List<Title> titles = await chopperRestClient
        .getFilms(query)
        .then((value) => value.body.titles);

    return titles;
  }
}
