import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/booking_create/index.dart';

class BookingCreatePage extends StatefulWidget {
  static const String routeName = '/bookingCreate';

  @override
  _BookingCreatePageState createState() => _BookingCreatePageState();
}

class _BookingCreatePageState extends State<BookingCreatePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingCreateBloc>(
      create: (context) => BookingCreateBloc(),
      child: BookingCreateScreen(),
    );
  }
}
