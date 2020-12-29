import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/index/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(builder: (
      BuildContext context,
      IndexState currentState,
    ) {
      if (currentState is InHomeState) {
        return Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Image.asset(
              'assets/header.png',
              fit: BoxFit.fitHeight,
            )
          ],
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
