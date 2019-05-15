import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/user.dart';

mixin UserProductsModel on Model {
  List<Product> _products = [];
  User authedUser;
  bool _isLoading = false;

  void addProduct(
      {String title, String description, double price, String image}) {
    Map productData = {
      "title": title,
      "description": description,
      "price": price,
      "image": "https://www.w3schools.com/w3css/img_lights.jpg",
      "userEmail": authedUser.email,
      "userId": authedUser.id,
    };
    _isLoading = true;
    notifyListeners();
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
        _isLoading = false;
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

  void fetchProducts() {
    List<Product> fetchedProductsList = [];
    _isLoading = true;
    notifyListeners();
    http.get("https://shopping-app-flutter.firebaseio.com/products.json").then(
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
        _isLoading = false;
        notifyListeners();
      },
    );
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

mixin HelperModels on UserProductsModel {
    bool get isLoading {
    return _isLoading;
  }
} 