import 'package:flutter/material.dart';

import './products_builder.dart';

class ProductsManager extends StatelessWidget {
  ProductsManager(this.products);
  final List<Map<String, dynamic>> products;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ProductsBuilder(products),
        ),
      ],
    );
  }
}
