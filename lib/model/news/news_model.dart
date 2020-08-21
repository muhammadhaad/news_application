import 'package:firebase_storage/firebase_storage.dart';

class NewsData {
  String articleId;
  String imageUrl;
  String heading;
  String description;
  String date;
  String category;

  //String authorID;
  int likes;
  bool like;

  NewsData(
      {this.articleId,
      this.imageUrl,
      this.heading,
      this.description,
      this.date,
      this.category,
      this.likes,
      this.like});
}
