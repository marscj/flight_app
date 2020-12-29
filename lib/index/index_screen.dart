import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';
import 'package:saadiyat/welcome/index.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({
    Key key,
  }) : super(key: key);

  @override
  IndexScreenState createState() {
    return IndexScreenState();
  }
}

class IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(builder: (
      BuildContext context,
      IndexState currentState,
    ) {
      if (currentState is InWelcomeState) {
        return WelcomePage();
      }

      if (currentState is InLoginState) {
        return FadeInUp(
          child: LoginPage(),
        );
      }

      if (currentState is InHomeState) {
        return FadeIn(
          child: HomePage(),
        );
      }

      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
