import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:saadiyat/widgets/listtitle.dart';

// ignore_for_file: close_sinks

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key key, this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<TicketDetailBloc, TicketDetailState>(builder: (
      BuildContext context,
      TicketDetailState currentState,
    ) {
      TicketDetailBloc ticketDetailBloc =
          BlocProvider.of<TicketDetailBloc>(context);
      final colorScheme = Theme.of(context).colorScheme;
      return EasyRefresh(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    child: ListBody(
                      children: [
                        (currentState?.data != null &&
                                currentState?.data?.status == 2)
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
                                      style:
                                          TextStyle(color: colorScheme.primary),
                                    ),
                                    onPressed: () {
                                      ticketDetailBloc.add(
                                          UpdateTicketEvent(currentState.data));
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      'Refuse',
                                      style:
                                          TextStyle(color: colorScheme.primary),
                                    ),
                                    onPressed: () {
                                      showConfrimModal(
                                          context,
                                          ticketDetailBloc,
                                          currentState.data,
                                          true);
                                    },
                                  )
                                ],
                              )
                            : Container(),
                        CustomListTitle(
                          title: 'SerialNo.:',
                          content: currentState?.data?.serial_no ?? '',
                        ),
                        Divider(),
                        CustomListTitle(
                            title: 'Status:',
                            content: currentState?.data?.type_text ?? ''),
                        Divider(),
                        CustomListTitle(
                          title: 'Process:',
                          content: currentState?.data?.status_text ?? '',
                        ),
                        Divider(),
                        CustomListTitle(
                          title: 'Air Line:',
                          content: currentState?.data?.air_line ?? '',
                        ),
                        Divider(),
                        CustomListTitle(
                          title: 'Air Class:',
                          content: currentState?.data?.air_class ?? '',
                        ),
                        Divider(),
                        CustomListTitle(
                          title: 'Air Information:',
                          content: currentState?.data?.air_info ?? '',
                        ),
                        Divider(),
                        CustomListTitle(
                          title: 'Fare:',
                          content: '${currentState?.data?.fare ?? ''}',
                        ),
                        Divider(),
                        CustomListTitle(
                          title: 'Tax:',
                          content: '${currentState?.data?.tax ?? ''}',
                        ),
                        Divider(),
                        CustomListTitle(
                          title: 'Total:',
                          content: '${currentState?.data?.total ?? ''}',
                        ),
                        Divider(),
                        CustomListTitle(
                          title: 'Remark:',
                          content: currentState?.data?.remark ?? '',
                        ),
                        Divider(),
                        CustomListTitle(
                          title: 'Create Date:',
                          content: currentState?.data?.date ?? '',
                        ),
                        // currentState?.data != null &&
                        //         currentState?.data?.is_confirm != null &&
                        //         currentState.data.is_confirm
                        //     ? ListBody(
                        //         children: [
                        //           Divider(),
                        //           Container(
                        //               padding: const EdgeInsets.all(15),
                        //               child: ElevatedButton(
                        //                 child: Text('Change/Cancel'),
                        //                 onPressed: () {
                        //                   showConfrimModal(
                        //                       context,
                        //                       ticketDetailBloc,
                        //                       currentState.data,
                        //                       false);
                        //                 },
                        //               ))
                        //         ],
                        //       )
                        //     : Container()
                      ],
                    ),
                  ),
                  Visibility(
                    visible: currentState?.data != null &&
                        currentState?.data?.status == 5,
                    child: ListBody(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: RaisedButton(
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Text('Cancel/Change Ticket'),
                            onPressed: () {
                              showConfrimModal(context, ticketDetailBloc,
                                  currentState.data, false);
                            },
                          ),
                          width: double.infinity,
                        ),
                      ],
                    ),
                  )
                ],
              )),
          firstRefresh: true,
          firstRefreshWidget: LinearProgressIndicator(),
          onRefresh: () async {
            await RestClient().getTicket(id).then((res) {
              ticketDetailBloc.add(RefreshTicketDetailEvent(res));
            }).catchError((error) {
              ticketDetailBloc.add(RefreshTicketDetailEvent(null));
            });
          });
    }));
  }
}

class ConfrimPostPage extends StatefulWidget {
  final TicketDetailBloc bloc;
  final Ticket data;
  final bool confirm;

  const ConfrimPostPage({Key key, this.bloc, this.data, this.confirm})
      : super(key: key);

  @override
  _ConfrimPostPageState createState() => _ConfrimPostPageState();
}

class _ConfrimPostPageState extends State<ConfrimPostPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfrimFormBloc>(
        create: (_) =>
            ConfrimFormBloc(widget.bloc, widget.data, widget.confirm),
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

Future<T> showConfrimModal<T>(BuildContext context, TicketDetailBloc bloc,
    Ticket data, bool confirm) async {
  return showModalBottomSheet<T>(
      context: context,
      builder: (BuildContext context) {
        return ConfrimPostPage(bloc: bloc, data: data, confirm: confirm);
      });
}
