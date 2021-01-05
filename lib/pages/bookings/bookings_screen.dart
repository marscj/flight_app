import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/router/router.gr.dart';

import 'bookings_bloc.dart';
import 'bookings_event.dart';
import 'bookings_state.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({
    Key key,
  }) : super(key: key);

  @override
  BookingsScreenState createState() {
    return BookingsScreenState();
  }
}

class BookingsScreenState extends State<BookingsScreen> {
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
    return BlocBuilder<BookingsBloc, BookingsState>(builder: (
      BuildContext context,
      BookingsState currentState,
    ) {
      // ignore: close_sinks
      BookingsBloc bookingsBloc = BlocProvider.of<BookingsBloc>(context);
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
                        background: Image.asset(
                          'assets/header.png',
                          fit: BoxFit.cover,
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Booking',
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
                        child: BookingItem(
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
              return RestClient().getBookings(query: {
                'pageNo': 1,
                'pageSize': currentState.pageSize,
                'sorter': '-id'
              }).then((res) {
                bookingsBloc.add(RefreshBookingsEvent(res));
              }).catchError((error) {
                bookingsBloc.add(RefreshBookingsEvent(null));
              }).whenComplete(() {
                _controller?.resetLoadState();
                _controller?.finishRefresh();
              });
            },
            onLoad: () async {
              return RestClient().getBookings(query: {
                'pageNo': currentState.pageNo,
                'pageSize': currentState.pageSize,
                'sorter': '-id'
              }).then((res) {
                bookingsBloc.add(LoadBookingsEvent(res));
              }).catchError((error) {
                bookingsBloc.add(LoadBookingsEvent(null));
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

class BookingItem extends StatelessWidget {
  const BookingItem({Key key, @required this.data}) : super(key: key);

  final Booking data;

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
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(14.0))),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  width: double.infinity,
                  child: AutoSizeText(
                    data.date,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  onTap: () {
                    context.router.push(BookingBasementRoute(id: data.id));
                  },
                  title: AutoSizeText(
                    data.title ?? '',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.black),
                      Expanded(
                          child: AutoSizeText(
                        data.remark ?? '',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.caption,
                      ))
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right, size: 30.0))
            ],
          )),
    );
  }
}
