import 'package:flutter/material.dart';

import '../models/product.dart';
import '../scoped_models/main.dart';

import "./product_edit.dart";

class ProductListPage extends StatefulWidget {
  ProductListPage(this.products, this.updateProd, this.deleteProd, this.fetchProducts);
  final List<Product> products;
  final Function updateProd;
  final Function deleteProd;
  final Function fetchProducts;

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  initState(){
    super.initState();
    widget.fetchProducts();
  }

  Widget _buildEditIcon(BuildContext context, index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage(
            product: widget.products[index],
            productIndex: index,
            updateProd: widget.updateProd,
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
          key: Key(widget.products[index].title),
          background: Container(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 1.35)),
            color: Colors.red[600],
            child: Icon(Icons.delete),
          ),
          onDismissed: (DismissDirection dir) {
            if (dir == DismissDirection.endToStart) {
              widget.deleteProd(index);
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.products[index].image),
                ),
                title: Text(widget.products[index].title),
                subtitle: Text("\$${widget.products[index].price}"),
                trailing: _buildEditIcon(context, index),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: widget.products.length,
    );
  }
}
