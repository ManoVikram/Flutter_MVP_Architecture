import 'package:flutter/material.dart';

import 'package:flutter_sqlite_mvp/screens/homeScreen.dart';
import 'package:flutter_sqlite_mvp/screens/loginScreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter SQflite MVP Architecture",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Learning(),
      routes: {
        HomeScreen.routeName: (contxt) => HomeScreen(),
        LoginScreen.routeName: (contxt) => LoginScreen(),
      },
    );
  }
}

class Learning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

void main() => runApp(MyApp());
