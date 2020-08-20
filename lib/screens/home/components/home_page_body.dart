import 'package:flutter/material.dart';
import 'package:news_application/model/news/news_generator.dart';
import 'package:news_application/model/news/news_model.dart';
import 'package:news_application/screens/home/components/tab_body.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<NewsData>>.value(
      value: NewsGenerator().news,
      child: TabBarView(children: <Widget>[
        TabBody("Explore"),
        TabBody("Entertainment"),
        TabBody("Sports"),
        TabBody("Technology"),
        TabBody("Politics"),
      ]),
    );
  }
}
