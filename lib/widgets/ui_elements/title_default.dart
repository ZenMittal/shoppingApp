import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  TitleDefault(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
        fontFamily: "Mont",
      ),
    );
  }
}
