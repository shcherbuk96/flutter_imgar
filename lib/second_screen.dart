import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imgar/film_sreen.dart';
import 'package:imgar/models/about_film_model.dart';
import 'dart:async';

import 'models/list_response.dart';

String titleScreen = "List Films";
String urlApi =
    "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/search/harrypotter";
String headerKeyValue = "9d2579bf43msh8b138883cc45695p1254cejsn4af7ec1ce4fc";
String headerKeyName = "x-rapidapi-key";

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title: Text(
            titleScreen,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListFilms());
  }
}

class ListFilms extends StatefulWidget {
  @override
  StateListFilms createState() => StateListFilms();
}

class StateListFilms extends State<ListFilms> {
  Future<ResponseData> futureRespData;

  Future<ResponseData> getData() async {
    var response = await http.get(urlApi, headers: {
      headerKeyName: headerKeyValue,
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      final res = ResponseData.fromJson(jsonResponse);
      return res;
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  @override
  void initState() {
    super.initState();
    futureRespData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      future: futureRespData,
      builder: (BuildContext context, AsyncSnapshot<ResponseData> snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data.titles.length,
              itemBuilder: (BuildContext context, int index) {
                return itemListView(snapshot.data, index);
              });
        }
      },
    ));
  }

  Widget itemListView(ResponseData resp, int index) {
    return Container(
        height: 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(resp.titles[index].image),
                fit: BoxFit.fill)),
        child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilmScreen(AboutFilm(
                              resp.titles[index].title,
                              resp.titles[index].image))));
                },
                color: Colors.yellow,
                child: Text(resp.titles[index].title),
              ),
            )));
  }
}
