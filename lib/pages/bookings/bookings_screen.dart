import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:saadiyat/widgets/custom_appbar.dart';

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
        appBar: CustomAppBar(
          title: Text('Bookings'),
        ),
        body: EasyRefresh(
            child: SingleChildScrollView(
                child: Column(
                    children: currentState.list.map((f) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: BookingItem(
                  data: f,
                ),
              );
            }).toList())),
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
                bookingsBloc.add(RefreshBookingsEvent(res, context));
              }).catchError((error) {
                bookingsBloc.add(RefreshBookingsEvent(null, context));
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
    return InkWell(
        onTap: () {
          context.router
              .push(BookingDetailRoute(id: data.id))
              .then((value) => {});
        },
        child: Badge(
            showBadge: data.messages.where((f) => (!f.read)).length > 0,
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
                          child: AutoSizeText(
                            data.date,
                            maxLines: 1,
                          )),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  data.title ?? '',
                                  maxLines: 3,
                                ),
                                SizedBox(height: 8),
                                AutoSizeText(
                                  data.remark ?? '',
                                  maxLines: 5,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ]))
                    ],
                  )),
            )));
  }
}
