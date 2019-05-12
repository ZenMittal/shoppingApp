import 'package:flutter/material.dart';

class User {
  User({this.id, this.email, this.password});
  
  @required
  final String id;
  @required
  final String email;
  @required
  final String password;
}
