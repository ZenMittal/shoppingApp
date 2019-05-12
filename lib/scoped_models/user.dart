import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';
import '../scoped_models/user_products.dart';

mixin UserModel on UserProducts {

  void login ({String email, String password}) {
    authedUser = User(id: "asdawdadfe", email: email, password: password);
  }
}