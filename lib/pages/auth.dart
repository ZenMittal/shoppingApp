import 'package:flutter/material.dart';

import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email;
  String _password;
  bool _terms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Email Address"),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SwitchListTile(
              value: _terms,
              onChanged: (bool value) {
                setState(() {
                  _terms = value;
                });
              },
              title: Text("Accept our terms and conditions"),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
              color: Theme.of(context).accentColor,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
