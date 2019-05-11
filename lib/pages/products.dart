import 'package:flutter/material.dart';

import '../models/product.dart';

import '../widgets/products/products_builder.dart';

class ProductsPage extends StatelessWidget {

  Widget _buildAppBar() {
    return AppBar(
      title: Text("List App"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite),
        )
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(context),
      body: ProductsBuilder(),
    );
  }
}
