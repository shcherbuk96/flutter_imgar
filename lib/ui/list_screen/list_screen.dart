import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgar/data/models/about_film_model.dart';
import 'package:imgar/ui/film_screen/film_sreen.dart';
import 'package:imgar/ui/list_screen/list_screen_bloc.dart';

final String titleScreen = "List Films";
final String hintSearchFiled = "Enter the movie";

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isSearching = false;

  final _bloc = ListScreenBloc();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListScreenBloc, ListScreenState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is GoToFilmScreenState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilmScreen(state.film)));
            });
          }
          return Scaffold(
            appBar: _appBar(),
            body: Center(
              child: listFilms(),
            ),
          );
        });
  }

  @override
  void initState() {
    _searchController.addListener(() {
      _bloc.add(SearchFilmEvent(_searchController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _searchController.dispose();
    super.dispose();
  }

  Widget listFilms() {
    if (_bloc.state is ListFilmsIsLoadingState) {
      // _bloc.add(RandomFilmsEvent()); //??
      return CircularProgressIndicator();
    } else {
      return ListView.builder(
          itemCount: _bloc.resp.titles.length,
          itemBuilder: (BuildContext context, int index) {
            return itemListView(index);
          });
    }
  }

  Widget itemListView(int index) {
    // return Column(
    //   children: <Widget>[
    //     CachedNetworkImage(
    //       height: 550,
    //       fit: BoxFit.fill,
    //       imageUrl: resp.titles[index].image,

    //       placeholder: (context, url) => CircularProgressIndicator(),
    //       errorWidget: (context, url, error) => new Icon(Icons.error),
    //     ),
    //     Container(
    //         child: Align(
    //             alignment: AlignmentDirectional.bottomCenter,
    //             child: SizedBox(
    //               width: double.infinity,
    //               child: MaterialButton(
    //                 onPressed: () {
    //                   _bloc.add(GoToFilmScreenEvent(AboutFilm(
    //                       resp.titles[index].title, resp.titles[index].image)));
    //                 },
    //                 color: Colors.yellow,
    //                 child: Text(resp.titles[index].title),
    //               ),
    //             )))
    //   ],
    // );
    return Container(
        height: 550,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(_bloc.resp.titles[index].image),
                fit: BoxFit.fill)),
        child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  _bloc.add(GoToFilmScreenEvent(AboutFilm(
                      _bloc.resp.titles[index].title,
                      _bloc.resp.titles[index].image)));
                },
                color: Colors.yellow,
                child: Text(_bloc.resp.titles[index].title),
              ),
            )));
  }

  AppBar _appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: Colors.yellow,
      title: _searchTitle(),
      actions: [isSearching ? _cancelIconButton() : _searchIconButton()],
    );
  }

  IconButton _searchIconButton() {
    return IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.black,
      ),
      onPressed: () {
        setState(() {
          this.isSearching = true;
        });
      },
    );
  }

  IconButton _cancelIconButton() {
    return IconButton(
      icon: Icon(
        Icons.cancel,
        color: Colors.black,
      ),
      onPressed: () {
        setState(() {
          _searchController.clear();
          this.isSearching = false;
        });
      },
    );
  }

  Widget _searchTitle() {
    return !isSearching
        ? Text(
            titleScreen,
            style: TextStyle(color: Colors.black),
          )
        : TextField(
            controller: _searchController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: hintSearchFiled,
                hintStyle: TextStyle(color: Colors.black)),
          );
  }
}
