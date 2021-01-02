import 'package:flutter/material.dart';

import 'bookings_screen.dart';

class BookingsPage extends StatefulWidget {
  static const String routeName = 'bookings';

  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: BookingsScreen(),
    );
  }
}
