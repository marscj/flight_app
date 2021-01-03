import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bta_bloc.dart';
import 'bta_state.dart';

class BtaScreen extends StatefulWidget {
  const BtaScreen({
    Key key,
  }) : super(key: key);

  @override
  BtaScreenState createState() {
    return BtaScreenState();
  }
}

class BtaScreenState extends State<BtaScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtaBloc, BtaState>(builder: (
      BuildContext context,
      BtaState currentState,
    ) {
      if (currentState is UnBtaState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorBtaState) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(currentState.errorMessage ?? 'Error'),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: RaisedButton(
                color: Colors.blue,
                child: Text('reload'),
                onPressed: _load,
              ),
            ),
          ],
        ));
      }
      if (currentState is InBtaState) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(currentState.hello),
              Text('Flutter files: done'),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: RaisedButton(
                  color: Colors.red,
                  child: Text('throw error'),
                  onPressed: () => _load(true),
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

  void _load([bool isError = false]) {}
}
