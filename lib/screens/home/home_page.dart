import 'package:flutter/material.dart';
import 'package:news_application/model/auth/user_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserAuthentication _auth = UserAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Droid Application"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await _auth.signOut();
              }),
        ],
      ),
      body: Column(
        children: <Widget>[Text("Hello how are you")],
      ),
    );
  }
}
