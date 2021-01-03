import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking_bloc.dart';
import 'booking_state.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    Key key,
  }) : super(key: key);

  @override
  BookingScreenState createState() {
    return BookingScreenState();
  }
}

class BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(builder: (
      BuildContext context,
      BookingState currentState,
    ) {
      return Scaffold();
    });
  }
}
