import 'package:flutter/material.dart';

import 'package:flutter_sqlite_mvp/screens/loginPresenter.dart';
import 'package:flutter_sqlite_mvp/models/user.dart';
import 'package:flutter_sqlite_mvp/data/dbHelper.dart';

import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginScreenContract {
  BuildContext _contxt;
  bool _isLoading = false;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _username;
  String _password;

  LoginScreenPresenter _presenter;

  _LoginScreenState() {
    _presenter = LoginScreenPresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(_contxt).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Future<void> onLoginSuccess(User user) async {
    _showSnackBar(user.toString());

    setState(() {
      _isLoading = false;
    });

    var db = DBHelper();
    await db.saveUser(user);

    Navigator.pop(context);
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _contxt = context;
    Widget loginButton = RaisedButton(
      onPressed: _submit,
      child: Text("Login"),
      color: Colors.green,
    );

    Widget loginForm = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "SQflite App Login",
          textScaleFactor: 2.0,
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) => _username = value,
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) => _password = value,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ),
            ],
          ),
        ),
        loginButton,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        key: scaffoldKey,
        title: Text("Login"),
      ),
      body: Container(
        child: Center(
          child: loginForm,
        ),
      ),
    );
  }
}
