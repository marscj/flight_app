import 'package:flutter/material.dart';
import 'booking_screen.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = 'booking';

  BookingPage(this.id);

  final int id;

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return BookingScreen(id: widget.id);
  }
}
