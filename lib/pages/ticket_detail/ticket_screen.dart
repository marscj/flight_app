import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key key, this.id}) : super(key: key);

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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('SerialNo.:'),
                  subtitle: Text(currentState?.data?.serial_no ?? ''),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('SerialNo.:'),
                  subtitle: Text(currentState?.data?.serial_no ?? ''),
                ),
                Divider(),
              ],
            ),
          ),
          firstRefresh: true,
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
