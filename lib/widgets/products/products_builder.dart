import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../../models/product.dart';
import '../../scoped_models/main.dart';

import './product_card.dart';

class ProductsBuilder extends StatelessWidget {

  Widget productCards;

  Widget _buildProductSection(products, toggleFav) {
    productCards = Center(
      child: Text("No Products. Please add some."),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, index) => ProductCard(products[index], toggleFav, index),
        itemCount: products.length,
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, child, MainModel model) {
      return _buildProductSection(model.displayedProducts, model.toggleFavorite);
    },);
  }
}
