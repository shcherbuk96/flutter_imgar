import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imgar/constants/routes_constants.dart';
import 'package:imgar/data/models/about_film_model.dart';
import 'package:imgar/ui/film_screen/film_sreen.dart';
import 'package:imgar/ui/list_screen/list_screen.dart';
import 'package:imgar/ui/main_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case listScreenRoute:
        return MaterialPageRoute(builder: (_) => ListScreen());
      case filmScreenRoute:
        return MaterialPageRoute(
            builder: (_) => FilmScreen(settings.arguments as AboutFilm));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
