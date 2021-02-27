import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/widgets/listtitle.dart';

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
            padding: const EdgeInsets.all(10),
            child: Card(
                child: Column(
              children: [
                CustomListTitle(
                  title: 'Create Date:',
                  content: currentState?.data?.date ?? '',
                ),
                Divider(),
                CustomListTitle(
                  title: 'Title:',
                  content: currentState?.data?.title ?? '',
                ),
                Divider(),
                CustomListTitle(
                  title: 'Remark:',
                  content: currentState?.data?.remark ?? '',
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
