import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/constants/routes_constants.dart';
import 'package:imgar/data/models/search_response/title_model.dart';
import 'package:imgar/data/services/service_data.dart';
import 'package:imgar/data/services/service_locator.dart';

//-----------------------------States--------------------------------//
abstract class ListScreenState {
  const ListScreenState();
}

class ListFilmsIsLoadingState extends ListScreenState {}

class ListFilmsIsLoadedState extends ListScreenState {}

class SearchFilmIsLoadingState extends ListScreenState {}

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
  final String film;

  const GoToFilmScreenEvent(this.film);
}

class InitEvent extends ListScreenEvent {}

//-------------------------------------------------------------------//

//#Bloc
class ListScreenBloc extends Bloc<ListScreenEvent, ListScreenState> {
  final navigationService = createNavigationService();
  List<Title> titles = [];
  final chopper = createRestClient();

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
      navigationService.navigateTo(filmScreenRoute, event.film);
    }
  }

  Stream<ListScreenState> handleTextChanged(String query) async* {
    if (query.length < 1) return;
    yield SearchFilmIsLoadingState();

    titles = await ServiceData().getFoundFilms(query);

    yield ListFilmsIsLoadedState();
  }

  Future init() async {
    titles = await ServiceData().getFoundFilms(textRequest);

    add(InitEvent());
  }
}
