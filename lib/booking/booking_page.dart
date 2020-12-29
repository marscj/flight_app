import 'package:flutter/material.dart';
import 'package:saadiyat/booking/index.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = '/booking';

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: BookingScreen(),
    );
  }
}
