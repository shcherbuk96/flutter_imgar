import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/constants/routes_constants.dart';
import 'package:imgar/data/services/database/db.dart';
import 'package:imgar/data/services/navigation/navigation_service.dart';
import 'package:imgar/data/services/navigation/routes.dart';
import 'package:imgar/data/services/service_locator.dart';
import 'package:imgar/generated/i18n.dart';
import 'package:imgar/ui/main_screen_bloc.dart';

var navigationService = locator<NavigationService>();

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();

  runApp(MaterialApp(
    localizationsDelegates: const [
      I18n.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: I18n.delegate.supportedLocales,
    navigatorKey: navigationService.navigatorKey,
    onGenerateRoute: Router.generateRoute,
    initialRoute: homeRoute,
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _bloc = locator.get<MainScreenBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenStates>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is NextScreenState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              navigationService.navigateTo(listScreenRoute, null);
            });
          } else if (state is ExitAppState) {
            exit(0);
          }

          return Scaffold(
            appBar: _appBar(),
            body: Center(
              child: Image.asset(imdb_logo),
            ),
            backgroundColor: Colors.transparent,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
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
        });
  }

  void initState() {
    super.initState();
    I18n.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      I18n.locale = locale;
    });
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(I18n.of(context).titlesMainScreen),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }

  FloatingActionButton _startFloatingActionButton(context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () {
        _bloc.add(NavigateToNextScreenEvent());
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
      onPressed: () => _bloc.add(ExitFromAppEvent()),
      child: Icon(
        Icons.clear,
        color: Colors.black,
      ),
      backgroundColor: Colors.yellow,
      splashColor: Colors.white,
    );
  }
}
