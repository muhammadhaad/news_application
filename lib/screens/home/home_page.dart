import 'package:flutter/material.dart';
import 'package:news_application/model/auth/user_auth.dart';
import 'file:///D:/Development/Mobile_Application/Projects/news_application/lib/model/user/user_info.dart';
import 'package:news_application/model/news/news_cat.dart';
import 'package:news_application/model/news/news_generator.dart';
import 'package:news_application/screens/addNews/addNewPost.dart';

import 'components/drawer.dart';
import 'components/home_page_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserAuthentication _auth = UserAuthentication();
  UserData user = new UserData();
  NewsGenerator _newsGenerator = new NewsGenerator();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Home Page")),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNewPost()));
                }),
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  await _auth.signOut();
                }),
          ],
          bottom: TabBar(isScrollable: true, tabs: tabWidget),
        ),
        drawer: DrawerClass(),
        body: HomePageBody(),
      ),
    );
  }
}
