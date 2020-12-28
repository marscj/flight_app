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
        return LoginPage();
      }

      if (currentState is InHomeState) {
        return HomePage();
      }

      if (currentState is ErrorIndexState) {
        return Scaffold(
            body: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(currentState.errorMessage ?? 'Error'),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: RaisedButton(
                color: Colors.blue,
                child: Text('reload'),
                onPressed: () => {
                  BlocProvider.of<IndexBloc>(context).add(LoadWelcomeEvent())
                },
              ),
            ),
          ],
        )));
      }

      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
