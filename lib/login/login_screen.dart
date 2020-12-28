import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';

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
    return BlocBuilder<IndexBloc, IndexState>(builder: (
      BuildContext context,
      IndexState currentState,
    ) {
      if (currentState is InLoginState) {
        return Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              children: [
                Column(children: [
                  SizedBox(height: 50),
                  SizedBox.fromSize(
                    size:
                        Size.fromHeight(MediaQuery.of(context).size.height / 4),
                    child:
                        Image.asset('assets/logo.png', fit: BoxFit.scaleDown),
                  ),
                  Text(
                    'SAADIYAT WAY',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ])
              ],
            )
          ],
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  void _load([bool isError = false]) {
    BlocProvider.of<IndexBloc>(context).add(LoadLoginEvent(isError));
  }
}
