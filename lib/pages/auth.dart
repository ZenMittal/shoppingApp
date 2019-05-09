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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _addBgImage() {
    return DecorationImage(
      image: AssetImage("lib/assets/img/cover.jpg"),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email Address", filled: true),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (!RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)")
            .hasMatch(value)) {
          return ("Not a valid email address.");
        }
      },
      onSaved: (value) {
        _email = value;
      },
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Password", filled: true),
      validator: (value) {
        if (value.trim().length < 8) {
          return ("Password should be at least 8 characters long");
        }
      },
      onSaved: (value) {
        _password = value;
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

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Navigator.pushReplacementNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth >= 550 ? 450 : deviceWidth * 0.85;
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
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmailInput(),
                    _buildPasswordInput(),
                    _buildTermsSwitch(),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      onPressed: _submitForm,
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
