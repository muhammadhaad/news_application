import 'dart:async';

import 'package:news_application/model/news/news_model.dart';
import 'package:provider/provider.dart';

class NewsGenerator {
  List<NewsData> _articleList = [
    NewsData(
        01,
        "assets/images/news_card_template.jpg",
        "Flutter testing projest and now testing for the heading line to hide the text at the end of the card",
        "This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text.This is a dummy text",
        "2020-07-04",
        "Technology",
        211,
        true),
    NewsData(02, "assets/images/news_card_template.jpg", "Dart",
        "This is a dummy text", "2020-03-04", "Sports", 10, false),
    NewsData(03, "assets/images/news_card_template.jpg", "XBOX",
        "This is a dummy text", "2020-05-04", "Entertainment", 2, true),
    NewsData(04, "assets/images/news_card_template.jpg", "Sports",
        "This is a dummy text", "2019-07-04", "Technology", 45, false),
    NewsData(05, "assets/images/news_card_template.jpg", "Dummy",
        "This is a dummy text", "2020-01-04", "Politics", 201, true),
  ];

  final _articleListStreamController = StreamController<List<NewsData>>();

  Stream<List<NewsData>> get articleListStream =>
      _articleListStreamController.stream;

  StreamSink<List<NewsData>> get articleListSink =>
      _articleListStreamController.sink;

  NewsGenerator() {
    _articleListStreamController.add(_articleList);
  }

  void dispose() {
    _articleListStreamController.close();
  }
}
