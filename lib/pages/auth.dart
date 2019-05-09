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

  DecorationImage _addBgImage() {
    return DecorationImage(
      image: AssetImage("lib/assets/img/cover.jpg"),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
    );
  }

  Widget _buildEmailInput() {
    return TextField(
      decoration: InputDecoration(labelText: "Email Address", filled: true),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _buildPasswordInput() {
    return TextField(
      decoration: InputDecoration(labelText: "Password", filled: true),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _buildTermsSwitch() {
    return SwitchListTile(
      value: _terms,
      onChanged: (bool value) {
        setState(() {
          _terms = value;
        });
      },
      title: Text("Accept our terms and conditions"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          image: _addBgImage(),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildEmailInput(),
                _buildPasswordInput(),
                _buildTermsSwitch(),
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
