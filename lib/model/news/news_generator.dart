import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_application/model/news/news_model.dart';

class NewsGenerator {
  final CollectionReference data = Firestore.instance.collection('NewsData');

  List<NewsData> _articleList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return NewsData(
        imageUrl: doc.data['image'] ?? '',
        category: doc.data['category'] ?? '',
        description: doc.data['description'] ?? 'Description',
        heading: doc.data['heading'] ?? 'Heading',
        date: doc.data['date'] ?? 'DD/MM/YYYY',
        like: doc.data['like'] ?? true,
        likes: doc.data['likes'] ?? 0,
      );
    });
  }

  Stream<QuerySnapshot> get news {
    return data.snapshots();
  }

  /* void abc() {
    data.getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        _articleList.add(NewsData(
          result.data['image'],
          result.data['heading'],
          result.data['description'],
          result.data['date'],
          result.data['category'],
          result.data['likes'],
          result.data['like'],
        ));
        //print(result.data);
      });
    });
  }*/

  final _articleListStreamController = StreamController<List<NewsData>>();

  Stream<List<NewsData>> get articleListStream =>
      _articleListStreamController.stream;

  StreamSink<List<NewsData>> get articleListSink =>
      _articleListStreamController.sink;

  NewsGenerator() {
    _articleListStreamController.add(_articleList);
    print(_articleList);
  }

  void dispose() {
    _articleListStreamController.close();
  }
}

/*[
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
  ]*/
