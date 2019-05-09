import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage(this.products);
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index){

      },
      itemCount: products.length,
    );
  }
}