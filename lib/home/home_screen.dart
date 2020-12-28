import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/welcome/index.dart';

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
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Flutter files: done'),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: RaisedButton(
                  color: Colors.red,
                  child: Text('throw error'),
                  onPressed: () {
                    BlocProvider.of<IndexBloc>(context).add(LoadWelcomeEvent());
                  },
                ),
              ),
            ],
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
