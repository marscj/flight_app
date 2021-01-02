import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/login/index.dart';

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
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
