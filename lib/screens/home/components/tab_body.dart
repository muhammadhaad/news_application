import 'package:flutter/material.dart';
import 'package:news_application/model/news/news_generator.dart';
import 'package:news_application/model/news/news_model.dart';
import 'package:news_application/screens/home/components/newsFeedCard.dart';

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
    return Container(
      child: StreamBuilder<List<NewsData>>(
        stream: _newsGenerator.articleListStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<NewsData>> snapshot) {
          if (snapshot.hasError) {
            Column(
              children: <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ],
            );
          }
          return RefreshIndicator(
            onRefresh: () async{
              refreshKey.currentState?.show(atTop: false);
              await Future.delayed(Duration(seconds: 2));
              ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  if (_title == "Explore")
                    return NewsFeedCard(snapshot, index);
                  else if (snapshot.data[index].category == _title)
                    return NewsFeedCard(snapshot, index);
                  else
                    return Container();
                },
              );
            },
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                if (_title == "Explore")
                  return NewsFeedCard(snapshot, index);
                else if (snapshot.data[index].category == _title)
                  return NewsFeedCard(snapshot, index);
                else
                  return Container();
              },
            ),
          );
        },
      ),
    );
  }
}
