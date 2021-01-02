import 'package:flutter/material.dart';

import 'login_screen.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(child: LoginScreen());
  }
}
