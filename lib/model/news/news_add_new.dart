import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Post {
  final CollectionReference data = Firestore.instance.collection('NewsData');

  final FirebaseStorage _store =
      FirebaseStorage(storageBucket: 'gs://news-application-fyp.appspot.com');

  StorageUploadTask _uploadTask;

  Future AddPost(
      File image, String heading, String description, String category) async {
    String aid = DateTime.now().toString();
    String filePath = 'newsCover/$aid.jpg';

    try {
      _uploadTask = await _store.ref().child(filePath).putFile(image);
      return await data.document().setData({
        'aid': aid,
        'heading': heading,
        'description': description,
        'category': category,
        'image': filePath,
        'date': aid,
        'like' : false,
        'likes': 0,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateLikeDislike(String id, bool like, int likes) async{
    print('abc' +id.toString());
    try{
      return await data.document(id.toString()).updateData({
        'like' : like,
        'likes': likes,
      }).then((value) {
        print("success");
      });
    }catch (e) {
      print(e.toString());
    }

  }
}
