import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';

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
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      title: Text(
                        'Booking',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
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
                _controller.resetLoadState();
                _controller.finishRefresh();
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
                _controller.finishLoad(
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

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 298.0;
  final Booking data;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      // size: Size.fromHeight(180),
      child: Card(
        elevation: 2,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.date),
                Divider(),
                AutoSizeText(
                  data.title ?? '',
                  maxLines: 1,
                ),
                AutoSizeText(
                  data.remark ?? '',
                  maxLines: 5,
                )
              ],
            )),
      ),
    );
  }
}
