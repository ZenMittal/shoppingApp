import 'package:flutter/material.dart';

import './products.dart';
import './products_control.dart';

class ProductsManager extends StatefulWidget {
  ProductsManager( Map<String, String> this.startingProd);
  final Map<String, String> startingProd;

  @override
  State<StatefulWidget> createState() {
    return _ProductsManagerState();
  }
}

class _ProductsManagerState extends State<ProductsManager> {
  List<Map <String, String>> _products = [];

  @override
  void initState() {
    super.initState();
    if (widget.startingProd != null) {
      _products.add(widget.startingProd);
    }
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
     _products.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductsControl(_addProduct),
        Expanded(
          child: Products(_products, deleteProd: _deleteProduct),
        ),
      ],
    );
  }
}
