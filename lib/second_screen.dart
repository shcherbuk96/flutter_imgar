import 'package:flutter/material.dart';
import 'package:imgar/film_sreen.dart';
import 'package:imgar/models/about_film_model.dart';
import 'package:imgar/services/dio_network.dart';

import 'models/list_response.dart';

String titleScreen = "List Films";

class SecondScreen extends StatefulWidget {
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  bool isSearching = false;
  Future<ResponseData> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title: !isSearching
              ? Text(titleScreen)
              : TextField(
                  onChanged: (value) {
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      setState(() {
                        data = DioNetworkService().restClient().getFilms(value);
                      });
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search film",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    },
                  )
          ],
        ),
        body: Center(
            child: FutureBuilder(
          future: data,
          builder:
              (BuildContext context, AsyncSnapshot<ResponseData> snapshot) {
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
        )));
  }

  @override
  void initState() {
    data = DioNetworkService().restClient().getFilms("Terminator");
    super.initState();
  }

  Widget itemListView(ResponseData resp, int index) {
    return Container(
        height: 550,
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
