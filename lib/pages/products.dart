import 'package:flutter/material.dart';

import '../widgets/products/products_builder.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage(this.products);
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose"),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Manage Products"),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/admin");
              },
            )
          ],
        ),
      ),
      body: ProductsBuilder(products),
    );
  }
}
