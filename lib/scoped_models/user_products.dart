import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/user.dart';

mixin UserProductsModel on Model {
  List<Product> _products = [];
  User authedUser;

  void addProduct(
      {String title, String description, double price, String image}) {
    Map productData = {
      "title": title,
      "description": description,
      "price": price,
      "image": "https://images.unsplash.com/photo-1557517356-8b497896a6fb"
    };
    http
        .post(
      "https://shopping-app-flutter.firebaseio.com/products.json",
      body: json.encode(productData),
    )
        .then(
      (http.Response response) {
        _products.add(
          Product(
            id: json.decode(response.body)["name"],
            title: title,
            description: description,
            price: price,
            image: image,
            userEmail: authedUser.email,
            userId: authedUser.id,
          ),
        );
        notifyListeners();
      },
    );
  }
}

mixin UserModel on UserProductsModel {
  void login({String email, String password}) {
    authedUser = User(id: "asdawdadfe", email: email, password: password);
  }
}

mixin ProductsModel on UserProductsModel {
  bool _isDisplayFavorite = false;

  bool get isDisplayFavorite {
    return _isDisplayFavorite;
  }

  List<Product> get allProducts {
    return List.from(_products);
  }

  void updateProduct(int index,
      {String title,
      String description,
      double price,
      String image,
      bool isFavorite}) {
    title = title != null ? title : _products[index].title;
    description =
        description != null ? description : _products[index].description;
    price = price != null ? price : _products[index].price;
    image = image != null ? image : _products[index].image;
    isFavorite = isFavorite != null ? isFavorite : _products[index].isFavorite;

    Product product = Product(
      id: _products[index].id,
      title: title,
      description: description,
      price: price,
      image: image,
      isFavorite: isFavorite,
      userEmail: _products[index].userEmail,
      userId: _products[index].userId,
    );
    _products[index] = product;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    final currentStatus = _products[index].isFavorite;
    final newStatus = !currentStatus;

    updateProduct(index, isFavorite: newStatus);
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void toggleDisplayFavorite() {
    _isDisplayFavorite = !_isDisplayFavorite;
    notifyListeners();
  }

  List<Product> get displayedProducts {
    if (_isDisplayFavorite) {
      return _products.where((product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }
}
