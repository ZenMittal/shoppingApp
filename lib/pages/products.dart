import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/main.dart';

import '../widgets/products/products_builder.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage(this.model);
  final MainModel model;

  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  initState() {
    super.initState();
    widget.model.fetchProducts();
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("List App"),
      actions: <Widget>[
        ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(model.isDisplayFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                model.toggleDisplayFavorite();
              },
            );
          },
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

  Widget _buildProductsBuilder(context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content;
        if (model.isLoading) {
          content = Center(child: CircularProgressIndicator());
        } else {
          content = ProductsBuilder();
        }
        return RefreshIndicator(child: content, onRefresh: () => model.fetchProducts(doRefresh: false),);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(context),
      body: _buildProductsBuilder(context),
    );
  }
}
