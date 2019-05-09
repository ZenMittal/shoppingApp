import 'package:flutter/material.dart';

import "./product_edit.dart";

class ProductListPage extends StatelessWidget {
  ProductListPage(this.products);
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ProductEditPage(product: products[index]);
              }));
            },
            child: Image.asset(products[index]["image"]),
          ),
          title: Text(products[index]["title"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ProductEditPage(product: products[index]);
              }));
            },
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
