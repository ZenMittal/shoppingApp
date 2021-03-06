import 'dart:convert';
import "dart:async";

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/user.dart';

mixin UserProductsModel on Model {
  List<Product> _products = [];
  User authedUser;
  bool _isLoading = false;
}

mixin UserModel on UserProductsModel {
  void login({String email, String password}) {
    authedUser = User(id: "asdawdadfe", email: email, password: password);
  }
}

mixin ProductsModel on UserProductsModel {
  Future<bool> addProduct(
      {String title, String description, double price, String image}) async {
    _isLoading = true;
    notifyListeners();

    Map productData = {
      "title": title,
      "description": description,
      "price": price,
      "image": "https://www.w3schools.com/w3css/img_lights.jpg",
      "userEmail": authedUser.email,
      "userId": authedUser.id,
    };

    try {
      final http.Response response = await http.post(
        "https://shopping-app-flutter.firebaseio.com/products",
        body: json.encode(productData),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
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
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  bool _isDisplayFavorite = false;

  bool get isDisplayFavorite {
    return _isDisplayFavorite;
  }

  List<Product> get allProducts {
    return List.from(_products);
  }

  Future<bool> updateProduct(int index,
      {String title,
      String description,
      double price,
      String image,
      bool isFavorite}) {
    _isLoading = true;
    notifyListeners();

    title = title != null ? title : _products[index].title;
    description =
        description != null ? description : _products[index].description;
    price = price != null ? price : _products[index].price;
    image = image != null ? image : _products[index].image;
    isFavorite = isFavorite != null ? isFavorite : _products[index].isFavorite;

    final Map<String, dynamic> updatedProductData = {
      "id": _products[index].id,
      "title": title,
      "description": description,
      "price": price,
      "image": image,
      "userEmail": _products[index].userEmail,
      "userId": _products[index].userId,
    };

    return http
        .put(
            "https://shopping-app-flutter.firebaseio.com/products/${_products[index].id}.json",
            body: json.encode(updatedProductData))
        .then(
      (http.Response response) {
        if (response.statusCode != 200 && response.statusCode != 201) {
          _isLoading = false;
          notifyListeners();
          return false;
        }
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

        _isLoading = false;
        notifyListeners();
        return true;
      },
    ).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  void toggleFavorite(int index) {
    final currentStatus = _products[index].isFavorite;
    final newStatus = !currentStatus;

    updateProduct(index, isFavorite: newStatus);
    notifyListeners();
  }

  Future<Null> fetchProducts({doRefresh = true}) {
    List<Product> fetchedProductsList = [];
    if (doRefresh) {
      _isLoading = true;
      notifyListeners();
    }

    return http
        .get("https://shopping-app-flutter.firebaseio.com/products.json")
        .then(
      (http.Response response) {
        Map<String, dynamic> productsData = json.decode(response.body);
        productsData.forEach(
          (String productId, dynamic productData) {
            Product product = Product(
              id: productId,
              title: productData["title"],
              description: productData["description"],
              image: productData["image"],
              price: productData["price"],
              userEmail: productData["userEmail"],
              userId: productData["userId"],
            );
            fetchedProductsList.add(product);
          },
        );
        _products = fetchedProductsList;
        if (doRefresh) {
          _isLoading = false;
        }
        notifyListeners();
      },
    );
  }

  void deleteProduct(int index) {
    _isLoading = true;
    final String prodId = _products[index].id;
    _products.removeAt(index);
    notifyListeners();
    http
        .delete(
            "https://shopping-app-flutter.firebaseio.com/products/${prodId}.json")
        .then(
      (http.Response response) {
        _isLoading = false;
        notifyListeners();
      },
    );
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

mixin HelperModel on UserProductsModel {
  bool get isLoading {
    return _isLoading;
  }
}
