import 'package:flutter/material.dart';
import 'package:news_application/model/auth/user_auth.dart';
import 'package:news_application/screens/authentication/switcher.dart';
import 'package:news_application/screens/home/home_page.dart';
import 'package:provider/provider.dart';

import 'model/auth/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: UserAuthentication().firebaseUserStream,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null ? Switcher() : HomePage();
  }
}
