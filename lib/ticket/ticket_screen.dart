import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/ticket/index.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({
    Key key,
  }) : super(key: key);

  @override
  TicketScreenState createState() {
    return TicketScreenState();
  }
}

class TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketBloc, TicketState>(builder: (
      BuildContext context,
      TicketState currentState,
    ) {
      if (currentState is UnTicketState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorTicketState) {
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
      if (currentState is InTicketState) {
        return Container();
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
