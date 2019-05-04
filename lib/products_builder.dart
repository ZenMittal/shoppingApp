import 'package:flutter/material.dart';

import 'pages/product.dart';

class ProductsBuilder extends StatelessWidget {
  ProductsBuilder(this.products);

  final List<Map<String, dynamic>> products;

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: Column(children: <Widget>[
      Image.asset(products[index]["imageURL"]),
      SizedBox(
        height: 7.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(products[index]["title"], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),),
          SizedBox(width: 10.0,),
          Text(products[index]["price"].toString())
        ],
      ),
      Center(
        child: FlatButton(
          child: Text("Details"),
          onPressed: () {
            Navigator.pushNamed<bool>(
              context,
              "/product/" + index.toString(),
            ).then((bool value) {
              if (value) {
                // deleteProd(index);
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
