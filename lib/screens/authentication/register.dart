import 'package:flutter/material.dart';
import 'package:news_application/model/auth/user_auth.dart';

//todo dumy code
class Register extends StatefulWidget {
  final Function toggle;

  Register({this.toggle});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final UserAuthentication _auth = UserAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Register"),
        elevation: 2.0,
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Username",
                  ),
                ),
                SizedBox(height: 10.0),
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
                    "Create a Account",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.indigo[200],
                  //todo have to put some styling
                  onPressed: () {
                    _auth.registerWithEmail(_emailController.text,
                        _passwordController.text, _usernameController.text);
                  },
                ),
                SizedBox(height: 10.0),
                FlatButton(
                  child: Text("Have an account? Login"),
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
