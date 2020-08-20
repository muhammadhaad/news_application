import 'package:flutter/material.dart';
import 'package:news_application/screens/home/components/tab_body.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: <Widget>[
      TabBody("Explore"),
      TabBody("Entertainment"),
      TabBody("Sports"),
      TabBody("Technology"),
      TabBody("Politics"),
    ]);
  }
}
