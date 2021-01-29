import 'package:flutter/material.dart';
import 'package:flutter_sqlite_mvp/models/user.dart';

import 'package:flutter_sqlite_mvp/screens/loginPresenter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginScreenContract {
  BuildContext contxt;
  bool _isLoading;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _username;
  String _password;

  LoginScreenPresenter _presenter;

  _LoginScreenState() {
    _presenter = LoginScreenPresenter(this);
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
  }

  @override
  void onLoginSuccess(User user) {
    // TODO: implement onLoginSuccess
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
