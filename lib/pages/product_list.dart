import 'package:flutter/material.dart';

import '../models/product.dart';

import "./product_edit.dart";

class ProductListPage extends StatelessWidget {
  ProductListPage(this.products, this.updateProd, this.deleteProd);
  final List<Product> products;
  final Function updateProd;
  final Function deleteProd;

  Widget _buildEditIcon(BuildContext context, index) {
    return IconButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return Dismissible(
          key: Key(products[index].title),
          background: Container(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 1.35)),
            color: Colors.red[600],
            child: Icon(Icons.delete),
          ),
          onDismissed: (DismissDirection dir) {
            if (dir == DismissDirection.endToStart) {
              deleteProd(index);
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index].image),
                ),
                title: Text(products[index].title),
                subtitle: Text("\$${products[index].price}"),
                trailing: _buildEditIcon(context, index),
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
