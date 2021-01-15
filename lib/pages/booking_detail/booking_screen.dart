import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';

import 'booking_detail_bloc.dart';
import 'booking_detail_event.dart';
import 'booking_detail_state.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key key, this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingDetailBloc, BookingDetailState>(builder: (
      BuildContext context,
      BookingDetailState currentState,
    ) {
      // ignore: close_sinks
      BookingDetailBloc bookingDetailBloc =
          BlocProvider.of<BookingDetailBloc>(context);
      return EasyRefresh(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Card(
                child: Column(
              children: [
                ListTile(
                  title: Text('Create Date:'),
                  subtitle: Text(currentState?.data?.date ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Title:'),
                  subtitle: Text(currentState?.data?.title ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Remark:'),
                  subtitle: Text(currentState?.data?.remark ?? ''),
                ),
              ],
            )),
          ),
          firstRefresh: currentState.data == null,
          firstRefreshWidget: LinearProgressIndicator(),
          onRefresh: () async {
            await RestClient().getBooking(id).then((res) {
              bookingDetailBloc.add(RefreshBookingDetailEvent(res));
            }).catchError((error) {
              bookingDetailBloc.add(RefreshBookingDetailEvent(null));
            });
          });
    });
  }
}
