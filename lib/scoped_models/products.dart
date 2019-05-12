import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

mixin ProductsModel on Model {
  List<Product> _products = [];

  bool _isDisplayFavorite = false;

  bool get isDisplayFavorite {
    return _isDisplayFavorite;
  }

  List<Product> get products {
    return List.from(_products);
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(index, Product product) {
    _products[index] = product;
    notifyListeners();
  }

  void toggleFavorite(index) {
    final currentStatus = products[index].isFavorite;
    final newStatus = !currentStatus;
    final product = Product(
      title: products[index].title,
      description: products[index].description,
      price: products[index].price,
      image: products[index].image,
      isFavorite: newStatus
    );
    updateProduct(index, product);
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
      return products.where((product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }
}
