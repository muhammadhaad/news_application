import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_application/model/news/news_generator.dart';
import 'package:news_application/screens/home/components/tab_body.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
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
