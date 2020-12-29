import 'package:flutter/material.dart';
import 'package:saadiyat/ticket/index.dart';

class TicketPage extends StatefulWidget {
  static const String routeName = '/ticket';

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket'),
      ),
      body: TicketScreen(),
    );
  }
}
