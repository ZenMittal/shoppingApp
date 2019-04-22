import 'package:flutter/material.dart';

import '../products_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List App"),
        ),
        body: ProductsManager({"title": "Icecream Please 😍😍😍", "imageURL": "lib/assets/cover.jpg"}),
      );
  }
}