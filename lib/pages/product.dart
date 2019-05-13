import 'package:flutter/material.dart';
import "dart:async";

import 'package:scoped_model/scoped_model.dart';

import "../models/product.dart";
import '../scoped_models/main.dart';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  ProductPage(this.prodIndex);
  final int prodIndex;

  _deleteDialog(BuildContext context, String title) {
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
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          Product product = model.allProducts[prodIndex];

          return Scaffold(
            appBar: AppBar(
              title: Text("Product Detail"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(product.image),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(product.title),
                ),
                Text(
                  "21 Baker Street, London | \$" + product.price.toString(),
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(model.allProducts[prodIndex].description),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () => _deleteDialog(context, product.title),
                    child: Text("Delete"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
