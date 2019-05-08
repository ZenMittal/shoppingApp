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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/img/cover.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
          ),
        ),
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Email Address", filled: true),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Password", filled: true),
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
                    Navigator.pushReplacementNamed(context, "/products");
                  },
                  color: Theme.of(context).accentColor,
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
