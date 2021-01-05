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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(builder: (
      BuildContext context,
      BookingState currentState,
    ) {
      // ignore: close_sinks
      BookingBloc bookingsBloc = BlocProvider.of<BookingBloc>(context);
      return EasyRefresh(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Create Date:'),
                  subtitle: Text(currentState?.data?.date ?? ''),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Title:'),
                  subtitle: Text(currentState?.data?.title ?? ''),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Remark:'),
                  subtitle: Text(currentState?.data?.remark ?? ''),
                ),
              ],
            ),
          ),
          firstRefresh: currentState.data == null,
          firstRefreshWidget: LinearProgressIndicator(),
          onRefresh: () async {
            await RestClient().getBooking(widget.id.toString()).then((res) {
              bookingsBloc.add(RefreshBookingEvent(res));
            }).catchError((error) {
              bookingsBloc.add(RefreshBookingEvent(null));
            });
          });
    });
  }
}
