import 'package:scoped_model/scoped_model.dart';

import './user_products.dart';

class MainModel extends Model with UserProductsModel, ProductsModel, UserModel, HelperModels {

}