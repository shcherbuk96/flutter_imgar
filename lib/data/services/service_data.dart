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
    // DB.table = id;
    // final res = await DB.db.getFilms().then((value) => value);

    // if (res != null && res.isNotEmpty) {
    //   return res[0];
    // }
    // print(res.toString());
    //  if (getInformationAboutFilmFromDB(id) != null) {
    // //   return await getInformationAboutFilmFromDB(id);
    // // } else {
    final film = await getInformationAboutFilmFromApi(id);
    // saveInformationAboutFilmFToDB(film);
    // //saveInformationAboutFilmFToDB(film);
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
      someDetailes.titleType.isNotEmpty ? true : false,
      filmResponse.title,
      filmResponse.title.isNotEmpty ? true : false,
      filmResponse.poster,
      filmResponse.poster.isNotEmpty ? true : false,
      filmResponse.plot,
      filmResponse.plot.isNotEmpty ? true : false,
      filmResponse.length,
      filmResponse.length.isNotEmpty ? true : false,
      someDetailes.year.toString(),
      someDetailes.year.toString().isNotEmpty ? true : false,
      filmResponse.rating,
      filmResponse.rating.isNotEmpty ? true : false,
      someDetailes.numberOfEpisodes.toString(),
      someDetailes.numberOfEpisodes != 0 ? true : false,
      someDetailes.seriesStartYear.toString(),
      someDetailes.seriesStartYear != 0 ? true : false,
      someDetailes.seriesEndYear.toString(),
      someDetailes.seriesEndYear != 0 ? true : false,
      filmResponse.trailer.link,
      filmResponse.trailer.link.isNotEmpty ? true : false,
    );

    return film;
  }

  getInformationAboutFilmFromDB(String id) async {
    List<AboutFilm> _results = await DB.db.getFilms();
    return _results[0];
  }

  saveInformationAboutFilmFToDB(AboutFilm filmFromAPI) async {
    await DB.db.insert(filmFromAPI);
  }

  getFoundFilms(String query) async {
    List<Title> titles = await chopperRestClient
        .getFilms(query)
        .then((value) => value.body.titles);

    return titles;
  }
}
