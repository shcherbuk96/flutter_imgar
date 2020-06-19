import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imgar/constants/routes_constants.dart';
import 'package:imgar/ui/film_screen/film_sreen.dart';
import 'package:imgar/ui/list_screen/list_screen.dart';
import 'package:imgar/ui/main_screen.dart';

import 'custom_page_route.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return PageAnimationRoute(MainScreen());
      case listScreenRoute:
        return PageAnimationRoute(ListScreen());
      case filmScreenRoute:
        return PageAnimationRoute(FilmScreen(settings.arguments as String));
      default:
        return PageAnimationRoute(Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ));
    }
  }
}
