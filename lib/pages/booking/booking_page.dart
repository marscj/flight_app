import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking_bloc.dart';
import 'booking_event.dart';
import 'booking_screen.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = '/booking';

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingBloc>(
      create: (context) => BookingBloc()..add(LoadBookingEvent()),
      child: BookingScreen(),
    );
  }
}

class BookingRoutePage extends StatefulWidget {
  @override
  _BookingRoutePageState createState() => _BookingRoutePageState();
}

class _BookingRoutePageState extends State<BookingRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: ExtendedNavigator(),
    );
  }
}
