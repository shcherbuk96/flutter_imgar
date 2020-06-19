import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/constants/routes_constants.dart';
import 'package:imgar/data/services/service_locator.dart';
import 'package:imgar/generated/i18n.dart';
import 'package:imgar/ui/film_screen/film_screen_bloc.dart';

final navigationService = createNavigationService();

class FilmScreen extends StatefulWidget {
  final String id;
  FilmScreen(this.id);

  @override
  _FilmScreenState createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  FilmScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = FilmScreenBloc(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is FilmIsLoadedState) {
            return _app(state);
          } else if (state is FilmIsLoadingState) {
            return Scaffold(
                backgroundColor: Colors.black,
                body: Center(child: CircularProgressIndicator()));
          }
          return _app(state);
        });
  }

  Scaffold _app(state) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: _appBar(),
        body: Stack(
          children: <Widget>[
            _blurBackgroundImage(),
            _bodyImage(),
            _bort(),
          ],
        ));
  }

  Padding _buildDetailsBottomSheet() {
    return Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_bloc.film.titleType,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: fontProximaNova)),
            SizedBox(height: 10),
            Text(_bloc.film.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontFamily: fontProximaNova)),
            SizedBox(height: 10),
            Text(_bloc.film.description,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: fontProximaNova)),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  color: Colors.white,
                ),
                SizedBox(width: 6),
                Text(_bloc.film.length,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: fontProximaNova)),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                SizedBox(width: 6),
                Text(_bloc.film.yearr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: fontProximaNova)),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                SizedBox(width: 6),
                Text(_bloc.film.rate,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: fontProximaNova)),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: <Widget>[
                Text("Episodes:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: fontProximaNova)),
                SizedBox(width: 6),
                Text(_bloc.film.episodes + " series",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: fontProximaNova)),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: <Widget>[
                Text(
                    _bloc.film.titleType +
                        " (" +
                        _bloc.film.startSeason +
                        " - " +
                        _bloc.film.endSeason +
                        ")",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: fontProximaNova)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => onTabTapped(0)),
                IconButton(
                    icon: Icon(Icons.save, color: Colors.white),
                    onPressed: () => onTabTapped(1))
              ],
            ),
          ],
        ));
  }

  DraggableScrollableSheet _bort() {
    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 0.5,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: _buildDetailsBottomSheet(),
          );
        });
  }

  InkWell _blurBackgroundImage() {
    return InkWell(
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_bloc.film.imageUrl),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          color: Colors.black.withOpacity(0),
        ),
      ),
    ));
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        _bloc.film.title,
        style: TextStyle(color: Colors.white, fontFamily: fontProximaNova),
      ),
      centerTitle: true,
    );
  }

  Widget _bodyImage() {
    if (_bloc.state is FilmIsSavingState) {
      showToast(
        I18n.of(context).toast_film_screenImageIsSaving,
      );
    } else if (_bloc.state is FilmIsSavedState) {
      showToast(
        I18n.of(context).toast_film_screenImageIsSaved,
      );
    }

    return Stack();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        navigationService.navigateTo(listScreenRoute, null);

        break;
      case 1:
        _bloc.add(SaveFilmImageEvent(_bloc.film.imageUrl));
    }
  }

  void showToast(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
