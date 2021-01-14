import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/widgets/list_item.dart';
import 'package:saadiyat/widgets/no_data.dart';

import 'ticket_detail_bloc.dart';
import 'ticket_detail_event.dart';
import 'ticket_detail_state.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({Key key, this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketDetailBloc, TicketDetailState>(builder: (
      BuildContext context,
      TicketDetailState currentState,
    ) {
      // ignore: close_sinks
      TicketDetailBloc bookingDetailBloc =
          BlocProvider.of<TicketDetailBloc>(context);
      return EasyRefresh(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ItineraryItem(
                  data: currentState.data.itinerary,
                ),
              )
            ],
          )),
          emptyWidget:
              currentState?.data?.itinerary == null ? NoDataWidget() : null,
          firstRefreshWidget: LinearProgressIndicator(),
          onRefresh: () async {
            await RestClient().getTicket(id).then((res) {
              bookingDetailBloc.add(RefreshTicketDetailEvent(res));
            }).catchError((error) {
              bookingDetailBloc.add(RefreshTicketDetailEvent(null));
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
                      Switch(
                        onChanged: null,
                        value: data.is_lock,
                      )
                    ],
                  )),
              Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                  child: Column(
                    children: [
                      ListItem(
                        icon: Icon(FontAwesomeIcons.ticketAlt),
                        title: 'Name:',
                        describe: data?.name ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Passprot:',
                        describe: data?.passport_no ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Email:',
                        describe: data?.email ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Exit:',
                        describe: data?.exit ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Entry:',
                        describe: data?.entry ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Ticket1:',
                        describe: data?.ticket1 ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Ticket2:',
                        describe: data?.ticket2 ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Hotel:',
                        describe: data?.hotel ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Remark:',
                        describe: data?.remark ?? '',
                      ),
                      ListItem(
                        icon: EmptyIcon(),
                        title: 'Create Date:',
                        describe: data?.date ?? '',
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
