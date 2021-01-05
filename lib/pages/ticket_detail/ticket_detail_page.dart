import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';

class TicketDetailPage extends StatefulWidget {
  static const String routeName = '/ticketDetail';

  final int id;

  const TicketDetailPage({@PathParam('id') this.id});

  @override
  _TicketDetailPageState createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicketDetail'),
      ),
      body: TicketDetailScreen(ticketDetailBloc: _ticketDetailBloc),
    );
  }
}
