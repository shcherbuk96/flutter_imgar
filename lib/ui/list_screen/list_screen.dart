import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:imgar/data/services/service_locator.dart';
import 'package:imgar/generated/i18n.dart';
import 'package:imgar/theme/assets.dart';
import 'package:imgar/theme/font_sizes.dart';
import 'package:imgar/theme/insets.dart';
import 'package:imgar/ui/list_screen/list_screen_bloc.dart';
import 'package:video_player/video_player.dart';

final navigationService = createNavigationService();

class ListScreen extends StatefulWidget {
  ListScreen({
    Key key,
  }) : super(key: key);
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isSearching = false;
  bool videoIsVisible = false;
  VideoPlayerController _videoPlayerController;

  ChewieController _chewieController;

  final _bloc = createListScreenBloc();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListScreenBloc, ListScreenState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: _listFilms(),
          );
        });
  }

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(Assets.urlIMDBpromo);

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: false,
        looping: true,
        autoInitialize: true);

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _searchController.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Widget _listFilms() {
    if (_bloc.state is ListFilmsIsLoadingState) {
      return Scaffold(
          backgroundColor: Colors.black,
          body: Center(child: SpinKitFoldingCube(
            itemBuilder: (context, index) {
              return DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
              );
            },
          )));
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          _silverAppBar(),
          _sliverList(),
        ],
      );
    }
  }

  Widget _itemSilverListView(int index) {
    return InkWell(
        onTap: () => {_bloc.add(GoToFilmScreenEvent(_bloc.titles[index].id))},
        child: Container(
            height: Insets.x87_5,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: _bloc.titles[index].image,
                  placeholder: (context, url) => Center(child: SpinKitWave(
                    itemBuilder: (context, index) {
                      return DecoratedBox(
                          decoration: BoxDecoration(color: Colors.white));
                    },
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Insets.x2, right: Insets.x1, bottom: Insets.x3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_bloc.titles[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizes.big_4x,
                              fontFamily: Assets.fontProximaNova)),
                    ],
                  ),
                )
              ],
            )));
  }

  SliverAppBar _silverAppBar() {
    return SliverAppBar(
        title: _searchTitle(),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [_cancelIconButton()],
        expandedHeight: Insets.x50,
        pinned: true,
        elevation: Insets.x5,
        flexibleSpace: InkWell(
            onTap: () => setState(() {
                  videoIsVisible = true;
                  _chewieController.play();
                }),
            child: Stack(
              children: <Widget>[
                Visibility(
                    visible: !videoIsVisible,
                    child: FlexibleSpaceBar(
                      background: Image.asset(Assets.imdb_header),
                    )),
                Visibility(
                    visible: videoIsVisible,
                    child: Chewie(
                      controller: _chewieController,
                    ))
              ],
            )));
  }

  SliverList _sliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => _itemSilverListView(index),
            childCount: _bloc.titles.length));
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
    return TextFormField(
      controller: _searchController,
      textInputAction: TextInputAction.done,
      style: TextStyle(
        color: Colors.white,
        fontFamily: Assets.fontProximaNova,
      ),
      onFieldSubmitted: (value) {
        _bloc.add(SearchFilmEvent(_searchController.text));
      },
      decoration: InputDecoration(
          hintText: I18n.of(context).search_list_screenHintSearchFiled,
          hintStyle: TextStyle(
              color: Colors.white, fontFamily: Assets.fontProximaNova)),
    );
  }
}
