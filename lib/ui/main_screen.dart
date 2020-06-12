import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/constants/routes_constants.dart';
import 'package:imgar/data/services/database/db.dart';
import 'package:imgar/data/services/navigation/navigation_service.dart';
import 'package:imgar/data/services/navigation/routes.dart';
import 'package:imgar/data/services/service_locator.dart';

var navigationService = locator<NavigationService>();
void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  runApp(MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    onGenerateRoute: Router.generateRoute,
    initialRoute: homeRoute,
    home: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Image.asset(imdb_logo),
      ),
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _startFloatingActionButton(context),
            _exitFloatingActionButton(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(title_text),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }

  FloatingActionButton _startFloatingActionButton(context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () {
        navigationService.navigateTo(listScreenRoute, null);
      },
      child: Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      backgroundColor: Colors.yellow,
      splashColor: Colors.white,
    );
  }

  FloatingActionButton _exitFloatingActionButton() {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () => exit(0),
      child: Icon(
        Icons.clear,
        color: Colors.black,
      ),
      backgroundColor: Colors.yellow,
      splashColor: Colors.white,
    );
  }
}
