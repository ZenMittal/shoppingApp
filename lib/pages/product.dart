import 'package:flutter/material.dart';
import "dart:async";

import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  ProductPage(
      {String this.title,
      String this.imageURL,
      String this.price,
      String this.description});
  final String title;
  final String imageURL;
  final String price;
  final String description;

  _deleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("This action can not be undone."),
            content: Text("Delete" + title + "?"),
            actions: <Widget>[
              FlatButton(
                  child: Text("Go Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageURL),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(title),
            ),
            Text(
              "21 Baker Street, London | \$" + price,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.0,),
            Text(description),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: () => _deleteDialog(context),
                child: Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
