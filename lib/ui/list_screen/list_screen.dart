import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/data/services/service_locator.dart';
import 'package:imgar/generated/i18n.dart';
import 'package:imgar/ui/list_screen/list_screen_bloc.dart';

final navigationService = createNavigationService();

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isSearching = false;

  final _bloc = createListScreenBloc();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListScreenBloc, ListScreenState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
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
      return Scaffold(
          backgroundColor: Colors.black,
          body: Center(child: CircularProgressIndicator()));
    } else {
      return ListView.builder(
          itemCount: _bloc.titles.length,
          itemBuilder: (BuildContext context, int index) {
            return itemListView(index);
          });
    }
  }

  Widget itemListView(int index) {
    return InkWell(
        onTap: () => {_bloc.add(GoToFilmScreenEvent(_bloc.titles[index].id))},
        child: Container(
            height: 350,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: _bloc.titles[index].image,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4, bottom: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_bloc.titles[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontFamily: fontProximaNova)),
                    ],
                  ),
                )
              ],
            )));
  }

  AppBar _appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: Colors.black,
      title: _searchTitle(),
      actions: [_cancelIconButton()],
    );
  }

  IconButton _cancelIconButton() {
    return IconButton(
      icon: Icon(
        Icons.cancel,
        color: Colors.white,
      ),
      onPressed: () {
        _searchController.clear();
      },
    );
  }

  Widget _searchTitle() {
    return TextField(
      controller: _searchController,
      style: TextStyle(
        color: Colors.white,
        fontFamily: fontProximaNova,
      ),
      decoration: InputDecoration(
          hintText: I18n.of(context).search_list_screenHintSearchFiled,
          hintStyle:
              TextStyle(color: Colors.white, fontFamily: fontProximaNova)),
    );
  }
}
