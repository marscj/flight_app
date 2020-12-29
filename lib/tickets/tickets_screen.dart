import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/tickets/index.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({
    Key key,
    @required TicketsBloc ticketsBloc,
  })  : _ticketsBloc = ticketsBloc,
        super(key: key);

  final TicketsBloc _ticketsBloc;

  @override
  TicketsScreenState createState() {
    return TicketsScreenState();
  }
}

class TicketsScreenState extends State<TicketsScreen> {
  TicketsScreenState();

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
                onPressed: _load,
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

  void _load([bool isError = false]) {
    widget._ticketsBloc.add(LoadTicketsEvent(isError));
  }
}
