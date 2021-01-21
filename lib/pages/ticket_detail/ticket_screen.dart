import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/router/router.gr.dart';

// ignore_for_file: close_sinks

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key key, this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketDetailBloc, TicketDetailState>(builder: (
      BuildContext context,
      TicketDetailState currentState,
    ) {
      TicketDetailBloc ticketDetailBloc =
          BlocProvider.of<TicketDetailBloc>(context);
      final colorScheme = Theme.of(context).colorScheme;
      return EasyRefresh(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Card(
                child: Column(
              children: [
                (currentState?.data != null &&
                            currentState?.data?.is_confirm == null) ||
                        true
                    ? MaterialBanner(
                        backgroundColor: Colors.orange,
                        content: ListTile(
                          title: Text(
                            'Please confirm your ticket information!',
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
                            onPressed: () {
                              ticketDetailBloc
                                  .add(UpdateTicketEvent(currentState.data));
                            },
                          ),
                          TextButton(
                            child: Text(
                              'Refuse',
                              style: TextStyle(color: colorScheme.primary),
                            ),
                            onPressed: () {
                              showConfrimModal(
                                  context, ticketDetailBloc, currentState.data);
                            },
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
                  title: Text('Confirm:'),
                  subtitle: Text(currentState?.data?.is_confirm == null
                      ? 'unconfirmed'
                      : currentState.data.is_confirm
                          ? 'Confirmed'
                          : 'Refusal'),
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
              ticketDetailBloc.add(RefreshTicketDetailEvent(res));
            }).catchError((error) {
              ticketDetailBloc.add(RefreshTicketDetailEvent(null));
            });
          });
    });
  }
}

class ConfrimPostPage extends StatefulWidget {
  final TicketDetailBloc bloc;
  final Ticket data;

  const ConfrimPostPage({Key key, this.bloc, this.data}) : super(key: key);

  @override
  _ConfrimPostPageState createState() => _ConfrimPostPageState();
}

class _ConfrimPostPageState extends State<ConfrimPostPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfrimFormBloc>(
        create: (_) => ConfrimFormBloc(widget.bloc, widget.data),
        child: Builder(
          builder: (context) {
            ConfrimFormBloc formBloc =
                BlocProvider.of<ConfrimFormBloc>(context);
            return FormBlocListener<ConfrimFormBloc, String, String>(
              onSubmitting: (context, state) {},
              onSuccess: (context, state) {
                context.router.popAndPush(SupportRoute(data: widget.data));
              },
              onFailure: (context, state) {},
              child: Scaffold(
                body: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    SizedBox(height: 10),
                    TextFieldBlocBuilder(
                      textFieldBloc: formBloc.reason,
                      textInputAction: TextInputAction.done,
                      maxLines: 3,
                      maxLength: 256,
                      decoration: InputDecoration(
                          labelText: 'Reason', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        formBloc.submit();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

Future<T> showConfrimModal<T>(
    BuildContext context, TicketDetailBloc bloc, Ticket data) async {
  return showModalBottomSheet<T>(
      context: context,
      builder: (BuildContext context) {
        return ConfrimPostPage(bloc: bloc, data: data);
      });
}
