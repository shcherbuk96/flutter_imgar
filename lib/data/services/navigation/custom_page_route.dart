import 'package:flutter/material.dart';

class PageAnimationRoute extends MaterialPageRoute {
  final screen;

  PageAnimationRoute(this.screen)
      : super(builder: (BuildContext context) => screen);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return ScaleTransition(scale: animation, child: screen);
  }
}
