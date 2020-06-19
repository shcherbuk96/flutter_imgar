import 'package:get_it/get_it.dart';
import 'package:imgar/data/services/navigation/navigation_service.dart';
import 'package:imgar/data/services/rest_api/rest_api.dart';
import 'package:imgar/data/services/rest_api/rest_details_api.dart';
import 'package:imgar/ui/list_screen/list_screen.dart';
import 'package:imgar/ui/list_screen/list_screen_bloc.dart';
import 'package:imgar/ui/main_screen_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => ListScreenBloc());
  locator.registerFactory(() => ListScreen());
  locator.registerFactory(() => RestClient.create());
  locator.registerFactory(() => RestDetailsClient.createDetailsFilm());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => MainScreenBloc());
  // locator.registerFactory<FilmScreenBloc>(() => FilmScreenBloc());
}

MainScreenBloc createMainScreenBloc() => locator.get<MainScreenBloc>();
ListScreenBloc createListScreenBloc() => locator.get<ListScreenBloc>();
ListScreen createListScreen() => locator.get<ListScreen>();
RestClient createRestClient() => locator.get<RestClient>();
RestDetailsClient createRestDetailsClient() => locator.get<RestDetailsClient>();
NavigationService createNavigationService() => locator.get<NavigationService>();
