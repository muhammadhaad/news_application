import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_application/model/news/news_generator.dart';
import 'package:news_application/screens/home/components/newsFeedCard.dart';
import 'package:provider/provider.dart';

class TabBody extends StatefulWidget {
  String _tabTitle;

  TabBody(String tabTitle) {
    this._tabTitle = tabTitle;
  }

  @override
  _TabBodyState createState() => _TabBodyState(_tabTitle);
}

class _TabBodyState extends State<TabBody> {
  String _title;

  _TabBodyState(String tabTitle) {
    this._title = tabTitle;
  }

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  final NewsGenerator _newsGenerator = NewsGenerator();

  @override
  void dispose() {
    super.dispose();
    _newsGenerator.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<QuerySnapshot>(context);
//    for (var doc in news.documents) {
//      print(doc.data);
//    }
      return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          if (_title == "Explore")
            return NewsFeedCard(snapshot, index);
          else if (snapshot.data[index].category == _title)
            return NewsFeedCard(snapshot, index);
          else
            return Container();
        },
      ),
  }
}
