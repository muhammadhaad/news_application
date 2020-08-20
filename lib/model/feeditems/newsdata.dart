import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService{
  final CollectionReference data = Firestore.instance.collection('newsdata');


  Future adddata() async {
    return await data.document().setData({
      'name': 'anees knjr ',
      'aird': '16-arid-234111',
    });
  }


  Future showdata()async{
    Firestore.instance
        .collection('abc')
        .document('data1')
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot 

      print('Values from db: $ds');
      print(ds.data);
    });
  }

  Future<String> geturl() async {
    final ref = FirebaseStorage.instance.ref().child('userImage/anees2020-08-19 01:43:58.551766.jpg');
    String url = await ref.getDownloadURL();
//    print('hello' + url);
    return(url);
    }
}