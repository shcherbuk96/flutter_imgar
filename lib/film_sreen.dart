import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:imgar/models/about_film_model.dart';

String titleScreen = "About Film";
String backBottomNavBarItem = "Back";
String saveBottomNavBarItem = "Save";

class FilmScreen extends StatefulWidget {
  final AboutFilm film;
  FilmScreen(this.film);

  @override
  _FilmScreenState createState() => _FilmScreenState(this.film);
}

class _FilmScreenState extends State<FilmScreen> {
  final AboutFilm film;
  _FilmScreenState(this.film);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(onTap: onTabTapped, items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back), title: Text(backBottomNavBarItem)),
          BottomNavigationBarItem(
              icon: Icon(Icons.save), title: Text(saveBottomNavBarItem)),
        ]),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            film.nameFilm,
            style: TextStyle(color: Colors.yellow),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(film.imageFilm), fit: BoxFit.fill)),
        ));
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pop(context);

        break;
      case 1:
        _onImageSaveButtonPressed();
    }
  }

  void _onImageSaveButtonPressed() async {
    var response = await http.get(film.imageFilm);

    debugPrint(response.statusCode.toString());

    await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  }
}
