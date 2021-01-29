import 'package:flutter/widgets.dart';

class User {
  String _username;
  String _password;

  User(
    @required this._username,
    @required this._password,
  );

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["password"];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
  }
}