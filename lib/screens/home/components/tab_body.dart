import 'package:flutter/material.dart';
import 'package:news_application/model/news/news_model.dart';
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

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<List<NewsData>>(context);
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        if (_title == "Explore")
          return NewsFeedCard(newsData: news[index]);
        else if (news[index].category == _title)
          return NewsFeedCard(newsData: news[index]);
        else
          return Container();
      },
    );
  }
}
