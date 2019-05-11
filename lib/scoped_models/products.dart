import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];

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
    // _productsCopy.removeAt(index);
  }
}
