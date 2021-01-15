import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/home/index.dart';
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
      // ignore_for_file: close_sinks
      // bool is_confirm;
      // bool is_cancel;
      // bool is_booking;
      // bool is_complete;
      TicketDetailBloc bookingDetailBloc =
          BlocProvider.of<TicketDetailBloc>(context);
      final colorScheme = Theme.of(context).colorScheme;
      return EasyRefresh(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Card(
                child: Column(
              children: [
                currentState?.data?.is_confirm == null
                    ? MaterialBanner(
                        backgroundColor: Colors.orangeAccent,
                        content: ListTile(
                          title: Text(
                            'Please confirm your ticket information',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(Icons.notifications_active),
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Confirm',
                              style: TextStyle(color: colorScheme.primary),
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: Text(
                              'Refuse',
                              style: TextStyle(color: colorScheme.primary),
                            ),
                            onPressed: () {},
                          )
                        ],
                      )
                    : Container(),
                ListTile(
                  dense: true,
                  title: Text('SerialNo.:'),
                  subtitle: Text(currentState?.data?.serial_no ?? ''),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  title: Text('Air Line:'),
                  subtitle: Text(currentState?.data?.air_line ?? ''),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  title: Text('Air Class:'),
                  subtitle: Text(currentState?.data?.air_class ?? ''),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  title: Text('Air Information:'),
                  subtitle: Text(currentState?.data?.air_info ?? ''),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  title: Text('Fare:'),
                  subtitle: Text('${currentState?.data?.fare ?? ''}'),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  title: Text('Tax:'),
                  subtitle: Text('${currentState?.data?.tax ?? ''}'),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  title: Text('Total:'),
                  subtitle: Text('${currentState?.data?.total ?? ''}'),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  title: Text('Remark:'),
                  subtitle: Text(currentState?.data?.remark ?? ''),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  title: Text('Create Date:'),
                  subtitle: Text(currentState?.data?.date ?? ''),
                ),
              ],
            )),
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
