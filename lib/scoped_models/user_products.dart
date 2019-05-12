import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

mixin UserProductsModel on Model {
  List<Product> _products = [];
  User authedUser;

  void addProduct(
      {String title, String description, double price, String image}) {
    _products.add(Product(
        title: title,
        description: description,
        price: price,
        image: image,
        userEmail: authedUser.email,
        userId: authedUser.id));
    notifyListeners();
  }
}


mixin UserModel on UserProductsModel {

  void login ({String email, String password}) {
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

  void updateProduct(int index, {String title, String description, double price, String image, bool isFavorite}) {
    title = title != null ? title : _products[index].title;
    description = description != null ? description : _products[index].description;
    price = price != null ? price : _products[index].price;
    image = image != null ? image : _products[index].image;
    isFavorite = isFavorite != null ? isFavorite : _products[index].isFavorite;
    Product product = Product(
      title: title,
      description: description,
      price: price,
      image: image,
      isFavorite: isFavorite,
      userEmail: _products[index].userEmail,
      userId: _products[index].userId
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

  void toggleDisplayFavorite () {
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
