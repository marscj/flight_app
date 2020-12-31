import 'package:flutter/material.dart';
import 'package:saadiyat/tickets/index.dart';

class TicketsPage extends StatefulWidget {
  static const String routeName = '/tickets';

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets'),
      ),
      body: TicketsScreen(),
    );
  }
}
