import 'package:scoped_model/scoped_model.dart';

import './user_products.dart';
import './products.dart';
import './user.dart';

class MainModel extends Model with UserProductsModel, ProductsModel, UserModel {

}