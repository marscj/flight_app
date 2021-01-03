import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking_bloc.dart';
import 'booking_screen.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = 'booking';

  BookingPage({@PathParam('id') this.id});

  final int id;

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingBloc>(
      create: (context) => BookingBloc(),
      child: BookingScreen(id: widget.id),
    );
  }
}
