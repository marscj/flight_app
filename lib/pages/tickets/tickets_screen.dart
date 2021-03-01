import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/pages/tickets/tickets_event.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:saadiyat/widgets/custom_appbar.dart';
import 'package:saadiyat/widgets/listtitle.dart';

import 'tickets_bloc.dart';
import 'tickets_state.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({
    Key key,
  }) : super(key: key);

  @override
  TicketsScreenState createState() {
    return TicketsScreenState();
  }
}

class TicketsScreenState extends State<TicketsScreen> {
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsBloc, TicketsState>(builder: (
      BuildContext context,
      TicketsState currentState,
    ) {
      // ignore: close_sinks
      TicketsBloc bookingsBloc = BlocProvider.of<TicketsBloc>(context);
      return Scaffold(
        appBar: CustomAppBar(
          title: Text('Tickets'),
        ),
        body: EasyRefresh(
            child: SingleChildScrollView(
                child: Column(
                    children: currentState.list.map((f) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: TicketItem(
                  data: f.last,
                ),
              );
            }).toList())),
            firstRefresh: currentState.list.length == 0,
            controller: _controller,
            enableControlFinishRefresh: true,
            enableControlFinishLoad: true,
            onRefresh: () async {
              return RestClient().getTickets(query: {
                'pageNo': 1,
                'pageSize': currentState.pageSize,
                'sorter': '-id'
              }).then((res) {
                bookingsBloc.add(RefreshTicketsEvent(res));
              }).catchError((error) {
                bookingsBloc.add(RefreshTicketsEvent(null));
              }).whenComplete(() {
                _controller?.resetLoadState();
                _controller?.finishRefresh();
              });
            },
            onLoad: () async {
              return RestClient().getTickets(query: {
                'pageNo': currentState.pageNo,
                'pageSize': currentState.pageSize,
                'sorter': '-id'
              }).then((res) {
                bookingsBloc.add(LoadTicketsEvent(res));
              }).catchError((error) {
                bookingsBloc.add(LoadTicketsEvent(null));
              }).whenComplete(() {
                _controller?.finishLoad(
                    noMore:
                        currentState.list.length >= currentState.totalCount);
              });
            }),
      );
    });
  }
}

class TicketItem extends StatelessWidget {
  const TicketItem({Key key, @required this.data}) : super(key: key);

  final Ticket data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.router.push(TicketDetailRoute(id: data.id));
        },
        child: Badge(
            showBadge: data.messages.where((f) => f.read == false).length > 0,
            badgeColor: Colors.red,
            position: BadgePosition.topStart(top: 0, start: -8),
            badgeContent: Text(
              "",
              style: TextStyle(color: Colors.white),
            ),
            child: Card(
              elevation: 4.0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0))),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(0.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: data.color,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(0.0))),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                data?.serial_no ?? '',
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              AutoSizeText(
                                data?.status_text ?? '',
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 0.0),
                          child: Column(children: [
                            CustomListTitle(
                                title: 'Status:',
                                content: data?.type_text ?? ''),
                            Divider(),
                            CustomListTitle(
                                title: 'Information:',
                                content: data?.air_info ?? ''),
                            Divider(),
                            CustomListTitle(
                                title: 'Air Line:',
                                content: data?.air_line ?? ''),
                            Divider(),
                            CustomListTitle(
                                title: 'Air Class:',
                                content: data?.air_class ?? ''),
                            Divider(),
                            CustomListTitle(
                                title: 'Total:',
                                content: data?.total?.toString() ?? ''),
                            Visibility(
                              visible: data?.remark != null &&
                                  data.remark.isNotEmpty,
                              child: ListBody(
                                children: [
                                  Divider(),
                                  CustomListTitle(
                                      title: 'Remark:',
                                      content: data?.remark ?? ''),
                                ],
                              ),
                            )
                          ]))
                    ],
                  )),
            )));
  }
}
