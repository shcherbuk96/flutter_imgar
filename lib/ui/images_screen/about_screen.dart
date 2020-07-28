import 'package:flutter/material.dart';
import 'package:imgar/constants/constants.dart';
import 'package:imgar/generated/i18n.dart';
import 'package:imgar/theme/assets.dart';
import 'package:imgar/theme/insets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({
    Key key,
  }) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(Insets.x2_5),
      child: Column(
        children: <Widget>[
          Image.asset(
            Assets.imdb,
            height: Insets.x50,
          ),
          SizedBox(
            height: Insets.x2_5,
          ),
          Text(
            imdb_description,
            style: TextStyle(
                color: Colors.white, fontFamily: Assets.fontProximaNova),
          ),
          SizedBox(
            height: Insets.x5,
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(right: Insets.x2_5, left: Insets.x2_5),
                  child: Image.asset(Assets.icon_instagram)),
              SizedBox(
                width: Insets.x1_5,
              ),
              InkWell(
                  onTap: () => launch(url_instagram),
                  child: Text(I18n.of(context).about_pageInstagram_login,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: Assets.fontProximaNova))),
            ],
          ),
          SizedBox(
            height: Insets.x2_5,
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(right: Insets.x2_5, left: Insets.x2_5),
                  child: Image.asset(Assets.icon_vk)),
              SizedBox(
                width: Insets.x1_5,
              ),
              InkWell(
                  onTap: () => launch(url_vk),
                  child: Text(I18n.of(context).about_pageVk_login,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: Assets.fontProximaNova))),
            ],
          ),
          SizedBox(
            height: Insets.x2_5,
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(right: Insets.x2_5, left: Insets.x2_5),
                  child: Image.asset(Assets.icon_skype)),
              SizedBox(
                width: Insets.x1_5,
              ),
              InkWell(
                  onTap: () => launch(url_skype),
                  child: Text(I18n.of(context).about_pageSkype_login,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: Assets.fontProximaNova))),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        I18n.of(context).about_pageTitle,
        style:
            TextStyle(color: Colors.white, fontFamily: Assets.fontProximaNova),
      ),
      centerTitle: true,
    );
  }
}
