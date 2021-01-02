import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ticket_bloc.dart';
import 'ticket_event.dart';
import 'ticket_screen.dart';

class TicketPage extends StatefulWidget {
  static const String routeName = 'ticket';

  TicketPage({@PathParam('id') this.id});

  final int id;

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TicketBloc>(
      create: (context) => TicketBloc()..add(LoadTicketEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ticket'),
        ),
        body: TicketScreen(),
      ),
    );
  }
}
