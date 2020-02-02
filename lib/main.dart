import 'package:flutter_login/successLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/loginPage.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: "Logare",),
    );
  }
}