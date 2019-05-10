import 'package:flutter/material.dart';

import "./product_edit.dart";

class ProductListPage extends StatelessWidget {
  ProductListPage(this.products, this.updateProd);
  final List<Map<String, dynamic>> products;
  final Function updateProd;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return Dismissible(
          key: Key(products[index]["title"]),
          background: Container(
            padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 1.35)),
            color: Colors.red[600],
            child: Icon(Icons.delete),
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index]["image"])),
                title: Text(products[index]["title"]),
                subtitle: Text("\$${products[index]["price"]}"),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ProductEditPage(
                        product: products[index],
                        productIndex: index,
                        updateProd: updateProd,
                      );
                    }));
                  },
                ),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
