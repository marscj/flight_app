import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/widgets/list_item.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            children: currentState?.data?.itineraries?.map((f) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
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
              bookingDetailBloc.add(RefreshBookingDetailEvent(res));
            }).catchError((error) {
              bookingDetailBloc.add(RefreshBookingDetailEvent(null));
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
      elevation: 8.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  width: double.infinity,
                  color: Colors.indigo,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: AutoSizeText(
                        data.serial_no ?? '',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Text('${data.is_lock ? 'Locked' : ''}',
                            style: TextStyle(color: Colors.white)),
                      ))
                    ],
                  )),
              Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                  child: Column(
                    children: [
                      ListTile(
                          title: Text('Name:'),
                          subtitle: Text(data?.name ?? '')),
                      Divider(),
                      ListTile(
                        title: Text('Passprot:'),
                        subtitle: Text(data?.passport_no ?? ''),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Email:'),
                        subtitle: Text(data?.email ?? ''),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Exit:'),
                        subtitle: Text(data?.exit ?? ''),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Entry:'),
                        subtitle: Text(data?.entry ?? ''),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Ticket1:'),
                        subtitle: Text(data?.ticket1 ?? ''),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Ticket2:'),
                        subtitle: Text(data?.ticket2 ?? ''),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Hotel:'),
                        subtitle: Text(data?.hotel ?? ''),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Remark:'),
                        subtitle: Text(data?.remark ?? ''),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Create Date:'),
                        subtitle: Text(data?.date ?? ''),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
