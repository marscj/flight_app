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
  int index = 0;
  @override
  Widget build(BuildContext context) {
    index++;
    print(index);
    print('booking page');
    return BookingScreen(id: widget.id);
  }
}
