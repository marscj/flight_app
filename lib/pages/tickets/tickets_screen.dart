import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/pages/tickets/tickets_event.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:saadiyat/widgets/list_item.dart';

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
    // TODO: implement dispose
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
        body: EasyRefresh.builder(
            builder: (context, physics, header, footer) {
              return CustomScrollView(
                physics: physics,
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 100.0,
                    pinned: true,
                    elevation: 8,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: false,
                        titlePadding: EdgeInsetsDirectional.only(
                          start: 36.0,
                          bottom: 16.0,
                        ),
                        background: Image.asset(
                          'assets/header.png',
                          fit: BoxFit.cover,
                        ),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Image.asset('assets/logo-title.png',
                                height: (100 - kToolbarHeight) / 2),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                'Ticket',
                              ),
                            ),
                          ],
                        )),
                  ),
                  header,
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: TicketItem(
                          data: currentState?.list[index],
                        ),
                      );
                    }, childCount: currentState?.list?.length ?? 0),
                  ),
                  footer
                ],
              );
            },
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
        child: Card(
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
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(14.0))),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      width: double.infinity,
                      child: AutoSizeText(
                        data?.serial_no ?? '',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                      child: Column(children: [
                        ListItem(
                          title: 'Air Line:',
                          describe: data?.air_line ?? '',
                        ),
                        ListItem(
                          title: 'Air Class:',
                          describe: data?.air_class ?? '',
                        ),
                        ListItem(
                          title: 'Total:',
                          describe: data?.total?.toString() ?? '',
                        ),
                        ListItem(
                          title: 'Information:',
                          describe: data?.air_info ?? '',
                        ),
                        ListItem(
                          title: 'Remark:',
                          describe: data?.remark ?? '',
                        ),
                      ]))
                ],
              )),
        ));
  }
}
