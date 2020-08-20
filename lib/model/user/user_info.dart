import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserData {
  String userID;
  String email;
  String imgUrl;

  UserData({
    this.email,
  });

  Future<String> getImageUrl(String id) async {
    final ref = FirebaseStorage.instance.ref().child(imgUrl);
    String url = await ref.getDownloadURL();
    return url;
  }
}
