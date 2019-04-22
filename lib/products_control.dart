import 'package:flutter/material.dart';

class ProductsControl extends StatelessWidget {
  ProductsControl(this.addProduct);
  final Function addProduct;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              addProduct({"title": "New Product (Gym Belt)","imageURL":"lib/assets/cover.jpg"});
            },
            child: Text("Add Product"),
          ),
        );
  }
}
