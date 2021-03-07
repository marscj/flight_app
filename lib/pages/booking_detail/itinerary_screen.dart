import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/widgets/listtitle.dart';
import 'package:saadiyat/widgets/no_data.dart';

import 'booking_detail_bloc.dart';
import 'booking_detail_event.dart';
import 'booking_detail_state.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({Key key, this.id}) : super(key: key);

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
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: currentState?.data?.itineraries?.map((f) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ItineraryItem(
                      data: f,
                    ),
                  );
                })?.toList() ??
                [],
          ),
          emptyWidget: currentState?.data?.itineraries?.length == 0
              ? NoDataWidget()
              : null,
          firstRefreshWidget: LinearProgressIndicator(),
          onRefresh: () async {
            await RestClient().getBooking(id).then((res) {
              bookingDetailBloc.add(RefreshBookingDetailEvent(res, context));
            }).catchError((error) {
              bookingDetailBloc.add(RefreshBookingDetailEvent(null, context));
            });
          });
    });
  }
}

class ItineraryItem extends StatelessWidget {
  const ItineraryItem({Key key, this.data}) : super(key: key);

  final Itinerary data;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: Container(
              width: double.infinity,
              // padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
              child: Column(
                children: [
                  CustomListTitle(
                      title: 'Serial No.:', content: data?.serial_no ?? ''),
                  Divider(),
                  CustomListTitle(
                      title: 'Status:',
                      content: '${data.is_lock ? 'Locked' : 'Normal'}'),
                  Divider(),
                  CustomListTitle(title: 'Name:', content: data?.name ?? ''),
                  Divider(),
                  CustomListTitle(
                    title: 'Passprot:',
                    content: data?.passport_no ?? '',
                  ),
                  Divider(),
                  CustomListTitle(
                    title: 'Email:',
                    content: data?.email ?? '',
                  ),
                  Divider(),
                  CustomListTitle(
                    title: 'Exit:',
                    content: data?.exit ?? '',
                  ),
                  Divider(),
                  CustomListTitle(
                    title: 'Entry:',
                    content: data?.entry ?? '',
                  ),
                  Divider(),
                  CustomListTitle(
                    title: 'Ticket1:',
                    content: data?.ticket1 ?? '',
                  ),
                  Divider(),
                  CustomListTitle(
                    title: 'Ticket2:',
                    content: data?.ticket2 ?? '',
                  ),
                  Divider(),
                  CustomListTitle(
                    title: 'Hotel:',
                    content: data?.hotel ?? '',
                  ),
                  Divider(),
                  CustomListTitle(
                    title: 'Remark:',
                    content: data?.remark ?? '',
                  ),
                  Divider(),
                  CustomListTitle(
                    title: 'Create Date:',
                    content: data?.date ?? '',
                  ),
                ],
              ))),
    );
  }
}
