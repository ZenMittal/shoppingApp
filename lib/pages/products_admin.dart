import 'package:flutter/material.dart';

import './products.dart';
import './product_edit.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  ProductsAdminPage(
      this.addProd, this.updateProd, this.deleteProd, this.products);
  final Function addProd;
  final Function updateProd;
  final Function deleteProd;
  final List<Map<String, dynamic>> products;

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
            ProductEditPage(addProd: addProd, deleteProd: deleteProd),
            ProductListPage(products, updateProd),
          ],
        ),
      ),
    );
  }
}
