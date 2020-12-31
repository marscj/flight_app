import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/bookings/index.dart';

class BookingsPage extends StatefulWidget {
  static const String routeName = '/bookings';

  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingsBloc>(
      create: (context) => BookingsBloc()..add(LoadBookingsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bookings'),
        ),
        body: BookingsScreen(),
      ),
    );
  }
}
