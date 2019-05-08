import 'package:flutter/material.dart';

import 'pages/product.dart';

class ProductsBuilder extends StatelessWidget {
  ProductsBuilder(this.products);

  final List<Map<String, dynamic>> products;

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]["imageURL"]),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                products[index]["title"],
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(4.0)),
                child: Text(
                  "\$" + products[index]["price"].toString(),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Text("It feels nice to be a programmer"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.pushNamed<bool>(
                    context,
                    "/product/" + index.toString(),
                  ).then((bool value) {
                    if (value) {
                      // deleteProd(index);
                    }
                  });
                },
              ),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.favorite_border),
                onPressed: (){},
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget productCards;

  Widget _buildProductSection() {
    productCards = Center(
      child: Text("No Products. Please add some."),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductSection();
  }
}
