import 'package:get_it/get_it.dart';
import 'package:imgar/data/services/navigation/navigation_service.dart';
import 'package:imgar/data/services/rest_api.dart';
import 'package:imgar/ui/list_screen/list_screen.dart';
import 'package:imgar/ui/list_screen/list_screen_bloc.dart';
import 'package:imgar/ui/main_screen_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<ListScreenBloc>(() => ListScreenBloc());
  locator.registerFactory<ListScreen>(() => ListScreen());
  locator.registerFactory<RestClient>(() => RestClient.create());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory<MainScreenBloc>(() => MainScreenBloc());
  // locator.registerFactory<FilmScreenBloc>(() => FilmScreenBloc());
}
