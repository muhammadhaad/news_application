import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_application/model/auth/user.dart';
import 'package:news_application/model/user/user_info.dart';
//import 'file:///D:/Development/Mobile_Application/Projects/news_application/lib/model/user/user_info.dart';
import 'package:provider/provider.dart';

class DrawerClass extends StatefulWidget {
  @override
  _DrawerClassState createState() => _DrawerClassState();
}
//todo incomplete
class _DrawerClassState extends State<DrawerClass> {
  UserData uData = new UserData();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
        stream: User(uid: user.uid).userData,
        builder: (context, snapshot) {
          return Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(snapshot.data['name']),
                  accountEmail: Text(snapshot.data['email']),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/drawer.jpeg') /*FutureBuilder(
                      future: uData.getImageUrl(snapshot.data['image']),
                      builder: (context,snapshot){
                        return Image.network(snapshot.data);
                      },
                    ),*/
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage('assets/images/drawer.jpeg'),
                        fit: BoxFit.cover,
                      )),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Account"),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                ),
                ListTile(
                  leading: Icon(Icons.bookmark),
                  title: Text("Liked"),
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Logout"),
                  onTap: () async {},
                ),
              ],
            ),
          );
        });
  }
}
