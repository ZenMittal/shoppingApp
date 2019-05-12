import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';

mixin UserModel on Model {
  User _authedUser;

  void login (String email, String password) {
    _authedUser = User(id: "asdawdadfe", email: email, password: password);

  }


}