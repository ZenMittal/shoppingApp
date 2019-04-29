import 'package:flutter/material.dart';
import "dart:async";

class ProductPage extends StatelessWidget {
  ProductPage({String this.title, String this.imageURL});
  final String title;
  final String imageURL;

  _deleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete" + title + "?"),
            content: Text("This action can not be undone."),
            actions: <Widget>[
              FlatButton(
                child: Text("Go Back"),
                onPressed: () {
                  Navigator.pop(context);
                }
              ),
              FlatButton(
                  child: Text("Delete"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  }),
            ],
          );
        });
  }

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
                onPressed: () => _deleteDialog(context),
                child: Text("Delete"),
              ),
            )
          ])),
    );
  }
}
