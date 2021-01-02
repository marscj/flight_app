import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tickets_bloc.dart';
import 'tickets_state.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({
    Key key,
  }) : super(key: key);

  @override
  TicketsScreenState createState() {
    return TicketsScreenState();
  }
}

class TicketsScreenState extends State<TicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsBloc, TicketsState>(builder: (
      BuildContext context,
      TicketsState currentState,
    ) {
      if (currentState is UnTicketsState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorTicketsState) {
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
      if (currentState is InTicketsState) {
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
