import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';

import 'booking_bloc.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key key, @required this.id}) : super(key: key);

  final int id;

  @override
  BookingScreenState createState() {
    return BookingScreenState();
  }
}

class BookingScreenState extends State<BookingScreen> {
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(builder: (
      BuildContext context,
      BookingState currentState,
    ) {
      // ignore: close_sinks
      BookingBloc bookingsBloc = BlocProvider.of<BookingBloc>(context);
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
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(),
                      );
                    }, childCount: 1),
                  ),
                ],
              );
            },
            firstRefresh: currentState.data == null,
            controller: _controller,
            enableControlFinishRefresh: true,
            onRefresh: () async {
              return RestClient().getBooking(widget.id.toString()).then((res) {
                bookingsBloc.add(RefreshBookingEvent(res));
              }).catchError((error) {
                bookingsBloc.add(RefreshBookingEvent(null));
              }).whenComplete(() {
                _controller.resetLoadState();
                _controller.finishRefresh();
              });
            }),
      );
    });
  }
}
