import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imgar/data/models/about_film_model.dart';
import 'package:imgar/ui/film_screen/film_screen_bloc.dart';

final String titleScreen = "About Film";
final String backBottomNavBarItem = "Back";
final String saveBottomNavBarItem = "Save";
final String imageIsSaving = "Saving...";
final String imageIsSaved = "Image is saved";

class FilmScreen extends StatefulWidget {
  final AboutFilm film;
  FilmScreen(this.film);

  @override
  _FilmScreenState createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  FilmScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = FilmScreenBloc(widget.film);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is FilmIsLoadedState) {
            return _app(state);
          } else if (state is FilmIsLoadingState) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return _app(state);
        });
  }

  Scaffold _app(state) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.yellow,
                ),
                title: Text(
                  backBottomNavBarItem,
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.save,
                    color: Colors.yellow,
                  ),
                  title: Text(saveBottomNavBarItem,
                      style: TextStyle(color: Colors.yellow))),
            ]),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            _bloc.film.nameFilm,
            style: TextStyle(color: Colors.yellow),
          ),
          centerTitle: true,
        ),
        body: bodyImage());
  }

  Widget bodyImage() {
    if (_bloc.state is FilmIsSavingState) {
      showToast(imageIsSaving);
    } else if (_bloc.state is FilmIsSavedState) {
      showToast(imageIsSaved);
    }

    return Stack(
      children: <Widget>[
        Image.network(
          _bloc.film.imageFilm,
          fit: BoxFit.fill,
          height: 650,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pop(context);

        break;
      case 1:
        _bloc.add(SaveFilmImageEvent(_bloc.film.imageFilm));
    }
  }

  void showToast(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.yellow,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}