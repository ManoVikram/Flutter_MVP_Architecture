import 'package:flutter_sqlite_mvp/data/restData.dart';
import 'package:flutter_sqlite_mvp/models/user.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestData api = RestData();

  LoginScreenPresenter(this._view);

  void doLogin(String username, String password) {
    api
        .login(username, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError));
  }
}
