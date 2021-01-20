import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/booking_detail/itinerary_screen.dart';
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
