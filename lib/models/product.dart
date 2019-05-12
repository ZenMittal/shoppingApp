import 'package:flutter/material.dart';

class Product {
  Product(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.image,
      this.isFavorite = false,
      @required this.userEmail,
      @required this.userId});
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavorite;
  final String userEmail;
  final String userId;
}
