import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  PriceTag(double this.price);
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(4.0)),
      child: Text(
        "\$" + price.toString(),
      ),
    );
  }
}
