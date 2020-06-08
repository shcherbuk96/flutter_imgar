import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imgar/ui/list_screen/list_screen.dart';

const imdb_logo = "assets/imdb.png";
const title_text = "Main Page";

void main() => runApp(MaterialApp(
      home: MainScreen(),
    ));

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
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => ListScreen()));
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
