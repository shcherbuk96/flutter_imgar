import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/constants/routes_constants.dart';
import 'package:imgar/data/models/about_film_model.dart';
import 'package:imgar/data/services/navigation/navigation_service.dart';
import 'package:imgar/data/services/service_locator.dart';
import 'package:imgar/ui/list_screen/list_screen_bloc.dart';
import 'package:imgar/data/models/title_model.dart';
import 'package:provider/provider.dart';

final navigationService = locator.get<NavigationService>();

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isSearching = false;

  final _bloc = locator.get<ListScreenBloc>();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListScreenBloc, ListScreenState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is GoToFilmScreenState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              navigationService.navigateTo(filmScreenRoute, state.film);
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
      return CircularProgressIndicator();
    } else {
      return ListView.builder(
          itemCount: _bloc.titles.length,
          itemBuilder: (BuildContext context, int index) {
            return itemListView(index);
          });
      // if(_bloc._titlesDB.isEmpty||_bloc._titlesDB.length==0){
      //   return ListView.builder(
      //     itemCount: _bloc.titles.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return itemListView(index);
      //     });
      // }
      // return ListView.builder(
      //     itemCount: _bloc._titlesDB.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return itemListView(index);
      //     });
    }
  }

  Widget itemListView(int index) {
    return Container(
        height: 550,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(_bloc.titles[index].image),
                fit: BoxFit.fill)),
        child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  _bloc.add(GoToFilmScreenEvent(AboutFilm(
                      _bloc.titles[index].title, _bloc.titles[index].image)));
                },
                color: Colors.yellow,
                child: Text(_bloc.titles[index].title),
              ),
            )));
  }

  AppBar _appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: Colors.yellow,
      title: _searchTitle(),
      actions: [_cancelIconButton()],
    );
  }

  IconButton _cancelIconButton() {
    return IconButton(
      icon: Icon(
        Icons.cancel,
        color: Colors.black,
      ),
      onPressed: () {
        _searchController.clear();
      },
    );
  }

  Widget _searchTitle() {
    return TextField(
      controller: _searchController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: hintSearchFiled, hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
