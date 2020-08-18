import 'package:flutter/material.dart';
import 'package:news_application/model/auth/user_auth.dart';

class Login extends StatefulWidget {
  final Function toggle;

  Login({this.toggle});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserAuthentication _auth = UserAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Login"),
        elevation: 2.0,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Skip Now',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red[900],
              ),
            ),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print("error signing in");
              } else {
                print("signed in");
                print(result.uid);
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "abc@xyz.com",
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.indigo[200],
                  //todo have to put some styling
                  onPressed: () {
                    print(
                        'email: ${_emailController.text} password: ${_passwordController.text}');
                  },
                ),
                SizedBox(height: 10.0),
                FlatButton(
                  child: Text("Need an account? Register"),
                  onPressed: () {
                    widget.toggle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
