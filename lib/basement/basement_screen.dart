import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/basement/index.dart';

class BasementScreen extends StatefulWidget {
  const BasementScreen({
    Key key,
  }) : super(key: key);

  @override
  BasementScreenState createState() {
    return BasementScreenState();
  }
}

class BasementScreenState extends State<BasementScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasementBloc, BasementState>(builder: (
      BuildContext context,
      BasementState currentState,
    ) {
      if (currentState is UnBasementState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorBasementState) {
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
                onPressed: () {},
              ),
            ),
          ],
        ));
      }
      if (currentState is InBasementState) {
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
                  onPressed: () => () {},
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
