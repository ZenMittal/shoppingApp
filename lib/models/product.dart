import 'package:flutter/material.dart';

class Product {
  Product(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.image});
  final String title;
  final String description;
  final double price;
  final String image;
}
