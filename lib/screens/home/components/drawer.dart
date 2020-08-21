import 'package:flutter/material.dart';
import 'package:news_application/model/auth/user.dart';
import 'package:news_application/model/user/user_info.dart';
import 'package:provider/provider.dart';

import '../../../model/auth/user_auth.dart';

class DrawerClass extends StatefulWidget {
  @override
  _DrawerClassState createState() => _DrawerClassState();
}
//todo incomplete
class _DrawerClassState extends State<DrawerClass> {
  UserData uData = new UserData();
  final UserAuthentication _auth = UserAuthentication();


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
                    backgroundImage: AssetImage('assets/images/user.png')
                    /*FutureBuilder(
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
                  leading: Icon(Icons.person),
                  title: Text("User Info"),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Logout"),
                  onTap: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
          );
        });
  }
}
