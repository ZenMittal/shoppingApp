import 'package:flutter/material.dart';

import '../../models/product.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';

class ProductCard extends StatelessWidget {
  ProductCard(this.product, this.toggleFav, this.prodIndex);

  final Product product;
  final Function toggleFav;
  final num prodIndex;

  Widget _buildAddressBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(4.0)),
      child: Text("21 Baker Street, London"),
    );
  }

  Widget _infoIconButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pushNamed<bool>(
          context,
          "/product/" + prodIndex.toString(),
        ).then((bool value) {
          if (value) {
            // deleteProd(index);
          }
        });
      },
    );
  }

  Widget _favIconButton(product, prodIndex) {
    return IconButton(
      color: Colors.red,
      icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
      onPressed: () {
        toggleFav(prodIndex);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(product.image),
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage("./lib/assets/img/blurred.jpg"),
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleDefault(product.title),
              SizedBox(
                width: 10.0,
              ),
              PriceTag(product.price),
            ],
          ),
          _buildAddressBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _infoIconButton(context),
              _favIconButton(product, prodIndex),
            ],
          ),
        ],
      ),
    );
  }
}
