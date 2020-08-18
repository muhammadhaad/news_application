import 'package:flutter/material.dart';
import 'package:news_application/screens/authentication/login.dart';
import 'package:news_application/screens/authentication/register.dart';

class Switcher extends StatefulWidget {
  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool viewLogin = true;
  void toggle() {
    setState(() => viewLogin = !viewLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (viewLogin) {
      return Login(toggle: toggle);
    } else {
      return Register(toggle: toggle);
    }
  }
}
