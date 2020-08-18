import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String uid;
  User({
    this.uid,
  });

  final CollectionReference userDataCollection =
      Firestore.instance.collection('UserData');

  final FirebaseStorage _store =
      FirebaseStorage(storageBucket: 'gs://news-application-fyp.appspot.com');

  StorageUploadTask _uploadTask;

  Stream<QuerySnapshot> get data {
    return userDataCollection.snapshots();
  }

  Future updateUserData(String name, String email, File image) async {
    String filePath = 'userImage/$name${DateTime.now()}.jpg';

    try {
      _uploadTask = await _store.ref().child(filePath).putFile(image);
      return await userDataCollection.document(uid).setData({
        'uid': uid,
        'name': name,
        'email': email,
        'image': filePath,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
