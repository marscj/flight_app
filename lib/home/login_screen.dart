import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/home/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  LoginScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (
      BuildContext context,
      HomeState currentState,
    ) {
      return Scaffold(
          body: Center(
              child: RaisedButton(
        child: Text('welcome'),
        onPressed: () =>
            {BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent(false))},
      )));
    });
  }

  void _load([bool isError = false]) {
    BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent(isError));
  }
}
