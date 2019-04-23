import 'package:flutter/material.dart';
import "dart:async";

class ProductPage extends StatelessWidget {
  ProductPage({String this.title, String this.imageURL});
  final String title;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Product Detail"),
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(imageURL),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(title),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pop(context, true),
                child: Text("Delete"),
              ),
            )
          ])),
    );
  }
}
