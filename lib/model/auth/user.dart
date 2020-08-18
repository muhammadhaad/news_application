import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  User({
    this.uid,
  });

  final CollectionReference userDataCollection =
      Firestore.instance.collection('UserData');

  Stream<QuerySnapshot> get data {
    return userDataCollection.snapshots();
  }

  Future updateUserData(String name) async {
    try {
      return await userDataCollection.document(uid).setData({
        'name': name,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
