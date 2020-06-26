import 'package:flutter/material.dart';
import 'package:imgar/constants/constants.dart';
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
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Image.asset(
            imdb,
            height: 200,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            imdb_description,
            style: TextStyle(color: Colors.white, fontFamily: fontProximaNova),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Image.asset(icon_instagram)),
              SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () => launch(url_instagram),
                  child: Text("Yauheni_Shcharbuk",
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontProximaNova))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Image.asset(icon_vk)),
              SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () => launch(url_vk),
                  child: Text("Zhenya Scherbuk",
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontProximaNova))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Image.asset(icon_skype)),
              SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () => launch(url_skype),
                  child: Text("Yauheni Shcharbuk",
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontProximaNova))),
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
        "About",
        style: TextStyle(color: Colors.white, fontFamily: fontProximaNova),
      ),
      centerTitle: true,
    );
  }
}
