import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imgar/routes_app.dart';
import 'package:imgar/second_screen.dart';

const imdb_logo = "assets/imdb.png";
const title_text = "Main Page";

void main() => runApp(MaterialApp(
      initialRoute: RoutesApp.mainScreen,
      routes: {
        RoutesApp.mainScreen: (context) => MainScreen(),
        RoutesApp.secondScreen: (context) => SecondScreen(),
      },
    ));

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(imdb_logo))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title_text),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesApp.secondScreen);
                },
                child: IconTheme(
                    data: IconThemeData(color: Colors.black),
                    child: Icon(Icons.play_arrow)),
                backgroundColor: Colors.yellow,
                splashColor: Colors.white,
              ),
              FloatingActionButton(
                heroTag: null,
                onPressed: () => exit(0),
                child: IconTheme(
                    data: IconThemeData(color: Colors.black),
                    child: Icon(Icons.clear)),
                backgroundColor: Colors.yellow,
                splashColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
