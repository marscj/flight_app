import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'bookings_bloc.dart';
import 'bookings_state.dart';

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
      return Scaffold(
        body: EasyRefresh.builder(
          builder: (context, physics, header, footer) {
            return CustomScrollView(
              physics: physics,
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 100.0,
                  pinned: true,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    title: Text(
                      'Booking',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                header,
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Text('abc');
                  }, childCount: 1),
                ),
                footer,
              ],
            );
          },
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              if (mounted) {
                setState(() {});
              }
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              if (mounted) {
                setState(() {});
              }
            });
          },
        ),
      );
    });
  }
}
