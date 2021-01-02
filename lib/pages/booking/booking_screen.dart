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
      if (currentState is UnBookingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorBookingState) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(currentState.errorMessage ?? 'Error'),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: RaisedButton(
                color: Colors.blue,
                child: Text('reload'),
                onPressed: () {},
              ),
            ),
          ],
        ));
      }
      if (currentState is InBookingState) {
        return Container();
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
