import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';

class TicketDetailScreen extends StatefulWidget {
  const TicketDetailScreen({
    Key key,
    @required TicketDetailBloc ticketDetailBloc,
  })  : _ticketDetailBloc = ticketDetailBloc,
        super(key: key);

  final TicketDetailBloc _ticketDetailBloc;

  @override
  TicketDetailScreenState createState() {
    return TicketDetailScreenState();
  }
}

class TicketDetailScreenState extends State<TicketDetailScreen> {
  TicketDetailScreenState();

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
    return BlocBuilder<TicketDetailBloc, TicketDetailState>(
        cubit: widget._ticketDetailBloc,
        builder: (
          BuildContext context,
          TicketDetailState currentState,
        ) {
          if (currentState is UnTicketDetailState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorTicketDetailState) {
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
           if (currentState is InTicketDetailState) {
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
    widget._ticketDetailBloc.add(LoadTicketDetailEvent(isError));
  }
}
