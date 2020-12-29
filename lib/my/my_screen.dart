import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/my/index.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({
    Key key,
  }) : super(key: key);

  @override
  MyScreenState createState() {
    return MyScreenState();
  }
}

class MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBloc, MyState>(builder: (
      BuildContext context,
      MyState currentState,
    ) {
      if (currentState is UnMyState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorMyState) {
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
      if (currentState is InMyState) {
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
