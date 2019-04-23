import 'package:flutter/material.dart';

import './products.dart';
import './product_create.dart';
import './product_list.dart';

class ManageProductsPage extends StatelessWidget {
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
                child: Text("First Tab"),
              ),
              Tab(
                child: Text("Second Tab"),
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
                title: Text("All Products"),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ProductsPage();
                  }));
                },
              )
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          ProductCreatePage(),
          ProductListPage(),
        ],),
      ),
    );
  }
}
