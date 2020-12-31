import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/bookings/index.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({
    Key key,
  }) : super(key: key);

  @override
  BookingsScreenState createState() {
    return BookingsScreenState();
  }
}

class BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(builder: (
      BuildContext context,
      BookingsState currentState,
    ) {
      if (currentState is UnBookingsState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorBookingsState) {
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
      if (currentState is InBookingsState) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(currentState.hello),
              Text('Flutter files: done'),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: RaisedButton(
                    color: Colors.red,
                    child: Text('throw error'),
                    onPressed: () => () {}),
              ),
            ],
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
