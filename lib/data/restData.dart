import 'package:flutter_sqlite_mvp/models/user.dart';
import 'package:flutter_sqlite_mvp/utils/networkUtils.dart';

class RestData {
  NetworkUtils _netUtil = NetworkUtils();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) {
    return Future.value(
      User(username, password),
    );
  }
}
