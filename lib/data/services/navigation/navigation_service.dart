import 'dart:io';

import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName, data) {
    if (data != null) {
      return navigatorKey.currentState.pushNamed(routeName, arguments: data);
    }
    return navigatorKey.currentState.pushNamed(routeName);
  }

  void pop() {
    navigatorKey.currentState.pop();
  }

  void exitApp() {
    exit(0);
  }
}
