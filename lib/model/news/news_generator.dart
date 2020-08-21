import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    }).toList();
  }

  Stream<List<NewsData>> get news {
    return data
        .snapshots()
        .map(_articleList);
  }


  Future<String> getPostImageUrl(String link) async {
    print('sss' + link);
    final ref = FirebaseStorage.instance.ref().child(link);
    String url = await ref.getDownloadURL();
    print('xxx' + url);
    return url;
  }
}
