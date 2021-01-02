import 'package:flutter/material.dart';

import 'login_screen.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  final void Function(bool isLoggedIn) onLoginResult;

  const LoginPage({Key key, this.onLoginResult}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(child: LoginScreen());
  }
}
