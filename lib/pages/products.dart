import 'package:flutter/material.dart';

import '../products_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List App"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose"),
            ),
            ListTile(
              title: Text("Something Something"),
              onTap: () {},
            )
          ],
        ),
      ),
      body: ProductsManager({
        "title": "Icecream Please 😍😍😍",
        "imageURL": "lib/assets/cover.jpg"
      }),
    );
  }
}
