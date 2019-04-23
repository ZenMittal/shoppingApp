import 'package:flutter/material.dart';

import 'pages/product.dart';

class ProductsBuilder extends StatelessWidget {
  ProductsBuilder(this.products, {this.deleteProd});

  final List<Map<String, String>> products;
  final Function deleteProd;

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: Column(children: <Widget>[
      Image.asset(products[index]["imageURL"]),
      Text(products[index]["title"]),
      Center(
        child: FlatButton(
          child: Text("Details"),
          onPressed: () {
            Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(
                      title: products[index]["title"],
                      imageURL: products[index]["imageURL"],
                    ),
              ),
            ).then((bool value) {
              if (value) {
                deleteProd(index);
              }
            });
          },
        ),
      )
    ]));
  }

  Widget productCards;

  Widget _buildProductSection() {
    productCards = Center(
      child: Text("No Products. Please add some."),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductSection();
  }
}
