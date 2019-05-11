import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  List<Product> _productsCopy; 

  List<Product> get products {
    _productsCopy = List.from(_products);
    return _productsCopy;
  }

  void addProduct(Product product) {
    _products.add(product);
  }

  void updateProduct(index, Product product) {
    _products[index] = product;
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    _productsCopy.removeAt(index);
  }
}
