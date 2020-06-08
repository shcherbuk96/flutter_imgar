import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgar/data/models/about_film_model.dart';
import 'package:imgar/data/models/list_response.dart';
import 'package:imgar/data/services/rest_api.dart';

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

class SearchFilmIsLoadedState extends ListScreenState {
  Future<ResponseData> fResp;

  SearchFilmIsLoadedState(this.fResp);
}
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
  ResponseData resp;

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
    //data = DioNetworkService().restClient().getFilms(query);
    // yield SearchFilmIsLoadedState(data);
  }

  Future init() async {
    final chopper = RestClient.create();
    resp = await chopper.getFilms("film").then((value) => value.body);
    add(InitEvent());
  }
}
