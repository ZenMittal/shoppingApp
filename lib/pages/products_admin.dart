import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/products.dart';
import '../models/product.dart';
import './products.dart';
import './product_edit.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Choose"),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("All Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/products");
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Manage Products"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 10.0),
                        Text("Create Product"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10.0),
                        Text("Edit Products"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            drawer: _buildDrawer(context),
            body: TabBarView(
              children: <Widget>[
                ProductEditPage(addProd: model.addProduct),
                ProductListPage(model.products, model.updateProduct, model.deleteProduct),
              ],
            ),
          ),
        );
      },
    );
  }
}
