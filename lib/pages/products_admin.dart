import 'package:flutter/material.dart';

import './products.dart';
import './product_create.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  ProductsAdminPage(this.addProd, this.deleteProd);
  final Function addProd;
  final Function deleteProd;

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
                icon: Icon(Icons.create),
                child: Text("Create Product"),
              ),
              Tab(
                icon: Icon(Icons.list),
                child: Text("All Products"),
              )
            ],
          ),
        ),
        drawer: Drawer(
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
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(addProd, deleteProd),
            ProductListPage(),
          ],
        ),
      ),
    );
  }
}
