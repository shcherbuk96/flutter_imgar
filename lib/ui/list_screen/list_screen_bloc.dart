import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/data/models/about_film_model.dart';
import 'package:imgar/data/models/db_item.dart';
import 'package:imgar/data/models/title_model.dart';
import 'package:imgar/data/services/database/db.dart';
import 'package:imgar/data/services/rest_api.dart';
import 'package:imgar/data/services/service_locator.dart';
import 'package:sqflite/sqflite.dart';

//-----------------------------States--------------------------------//
abstract class ListScreenState {
  const ListScreenState();
}

class ListFilmsIsLoadingState extends ListScreenState {}

class ListFilmsIsLoadedState extends ListScreenState {}

class SearchFilmIsLoadingState extends ListScreenState {}

class GoToFilmScreenState extends ListScreenState {
  final AboutFilm film;

  const GoToFilmScreenState(this.film);
}

class SearchFilmIsLoadedState extends ListScreenState {}
//-------------------------------------------------------------------//

//--------------------------Events----------------------------------//
abstract class ListScreenEvent {
  const ListScreenEvent();
}

class SearchFilmEvent extends ListScreenEvent {
  final String name;

  const SearchFilmEvent(this.name);
}

class RandomFilmsEvent extends ListScreenEvent {}

class GoToFilmScreenEvent extends ListScreenEvent {
  final AboutFilm film;

  const GoToFilmScreenEvent(this.film);
}

class InitEvent extends ListScreenEvent {}

//-------------------------------------------------------------------//

//#Bloc
class ListScreenBloc extends Bloc<ListScreenEvent, ListScreenState> {
  List<Title> titles = [];
  List<TitleItem> _titlesDB = [];
  final chopper = locator.get<RestClient>();
  Database database = DB.getDB();

  ListScreenBloc() {
    init();
  }

  @override
  ListScreenState get initialState => ListFilmsIsLoadingState();

  @override
  Stream<ListScreenState> mapEventToState(ListScreenEvent event) async* {
    if (event is InitEvent) {
      yield ListFilmsIsLoadedState();
    } else if (event is SearchFilmEvent) {
      yield* handleTextChanged(event.name);
    } else if (event is GoToFilmScreenEvent) {
      yield GoToFilmScreenState(event.film);
    }
  }

  Stream<ListScreenState> handleTextChanged(String query) async* {
    if (query.length < 1) return;
    yield SearchFilmIsLoadingState();

    Future.delayed(Duration(milliseconds: 1000)).then((value) async {
      titles = await chopper.getFilms(query).then((value) => value.body.titles);
      // titles.forEach((element) {
      //   _save(element);
      // });
      // DB.nameTable = query;

      // String path = await getDatabasesPath() + 'imgar';

      // await databaseExists(path).then((value) {
      //   if (!value) {
      //     print(value);
      //     database.execute(
      //         'CREATE TABLE $query (id INTEGER PRIMARY KEY NOT NULL, title STRING, image STRING)');
      //   }
      //   print(value);
      // });

      // List<Map<String, dynamic>> _results = await DB.query(DB.nameTable);
      // _titlesDB = _results.map((item) => TitleItem.fromMap(item)).toList();

      // if (_titlesDB.isNotEmpty) {
      //   _titlesDB.forEach((element) {
      //     titles.add(Title(
      //         id: element.id.toString(),
      //         title: element.title,
      //         image: element.image));
      //   });
      // }

      // if (titles.isEmpty) {
      //   titles =
      //       await chopper.getFilms(query).then((value) => value.body.titles);
      //   titles.forEach((element) {
      //     _save(element);
      //   });
      // }
    });

    yield ListFilmsIsLoadedState();
  }

  Future<bool> databaseExists(String path) {
    return databaseFactory.databaseExists(path);
  }

  Future init() async {
    List<Map<String, dynamic>> _results = await DB.query(DB.nameTable);
    _titlesDB = _results.map((item) => TitleItem.fromMap(item)).toList();
    if (_titlesDB.isNotEmpty) {
      _titlesDB.forEach((element) {
        titles.add(Title(
            id: element.id.toString(),
            title: element.title,
            image: element.image));
      });
    }

    if (titles.isEmpty) {
      titles = await chopper
          .getFilms(textRequest)
          .then((value) => value.body.titles);
      titles.forEach((element) {
        _save(element);
      });
    }

    add(InitEvent());
  }

  void _save(Title obj) async {
    TitleItem item = TitleItem(image: obj.image, title: obj.title);
    await DB.insert(DB.nameTable, item);
  }
}
