import 'package:flutter/material.dart';
import 'package:saadiyat/bookings/index.dart';

class BookingsPage extends StatefulWidget {
  static const String routeName = '/bookings';

  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  final _bookingsBloc = BookingsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: BookingsScreen(bookingsBloc: _bookingsBloc),
    );
  }
}
