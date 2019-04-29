import 'package:flutter/material.dart';

import './products_builder.dart';
import './products_control.dart';

class ProductsManager extends StatelessWidget {
  ProductsManager(this.products, this.addProd, this.deleteProd);
  final List<Map<String, String>> products;
  final Function addProd;
  final Function deleteProd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductsControl(addProd),
        Expanded(
          child: ProductsBuilder(products, deleteProd: deleteProd),
        ),
      ],
    );
  }
}
