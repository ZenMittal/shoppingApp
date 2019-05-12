import 'package:scoped_model/scoped_model.dart';

import './user.dart';
import './products.dart';

import '../models/product.dart';
import '../models/user.dart';

mixin UserProducts on Model {
  List<Product> products = [];
  User authedUser;

  void addProduct(
      {String title, String description, double price, String image}) {
    products.add(Product(
        title: title,
        description: description,
        price: price,
        image: image,
        userEmail: authedUser.email,
        userId: authedUser.id));
    notifyListeners();
  }
}
