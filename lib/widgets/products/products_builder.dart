import 'package:flutter/material.dart';

import './product_card.dart';

class ProductsBuilder extends StatelessWidget {
  ProductsBuilder(this.products);

  final List<Map<String, dynamic>> products;

  Widget productCards;

  Widget _buildProductSection() {
    productCards = Center(
      child: Text("No Products. Please add some."),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, index) => ProductCard(products[index], index),
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
