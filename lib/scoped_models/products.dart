import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../scoped_models/user_products.dart';


mixin ProductsModel on UserProducts {

  bool _isDisplayFavorite = false;

  bool get isDisplayFavorite {
    return _isDisplayFavorite;
  }

  List<Product> get allProducts {
    return List.from(products);
  }

  void updateProduct(int index, {String title, String description, double price, String image, bool isFavorite}) {
    title = title != null ? title : products[index].title;
    description = description != null ? description : products[index].description;
    price = price != null ? price : products[index].price;
    image = image != null ? image : products[index].image;
    isFavorite = isFavorite != null ? isFavorite : products[index].isFavorite;
    Product product = Product(
      title: title,
      description: description,
      price: price,
      image: image,
      isFavorite: isFavorite,
      userEmail: products[index].userEmail,
      userId: products[index].userId
    );
    products[index] = product;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    final currentStatus = products[index].isFavorite;
    final newStatus = !currentStatus;

    updateProduct(index, isFavorite: newStatus);
    notifyListeners();
  }

  void deleteProduct(int index) {
    products.removeAt(index);
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
    return List.from(products);
  }
}
