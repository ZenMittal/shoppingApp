import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/products.dart';

import './product_card.dart';

class ProductsBuilder extends StatelessWidget {

  Widget productCards;

  Widget _buildProductSection(products) {
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
    return ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, child, ProductsModel model) {
      return _buildProductSection(model.products);
    },);
  }
}
