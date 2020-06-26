import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/data/services/service_locator.dart';
import 'package:imgar/ui/navigation_page/navigation_page_bloc.dart';

import '../../data/services/service_locator.dart';
import '../../generated/i18n.dart';

class NavigationPage extends StatefulWidget {
  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  final _bloc = createNavigationPageBloc();

  _onTapBar(int index) {
    _bloc.add(PageTappedEvent(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is PageLoadingState) {
              return Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(child: SpinKitFoldingCube(
                    itemBuilder: (context, index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      );
                    },
                  )));
            } else if (state is ListScreenLoadedState) {
              return createListScreen();
            } else if (state is AboutScreenLoadedState) {
              return createAboutScreen();
            }
            return Container();
          }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _bloc.currentIndex,
        onTap: _onTapBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              I18n.of(context).navigation_pageHome,
              style:
                  TextStyle(color: Colors.white, fontFamily: fontProximaNova),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: Text(
              I18n.of(context).navigation_pageAbout,
              style:
                  TextStyle(color: Colors.white, fontFamily: fontProximaNova),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _bloc.add(AppStartedEvent());
    super.initState();
  }
}
