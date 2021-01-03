import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(builder: (
      BuildContext context,
      BookingsState currentState,
    ) {
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
                    return BookingItem(
                      data: currentState?.list[index],
                    );
                  }, childCount: currentState?.list?.length ?? 0),
                ),
                footer,
              ],
            );
          },
          firstRefresh: true,
          enableControlFinishRefresh: true,
          enableControlFinishLoad: true,
          controller: bookingsBloc.easyRefreshController,
          onRefresh: () async {
            bookingsBloc.add(RefreshBookingsEvent());
          },
          onLoad: () async {
            bookingsBloc.add(LoadBookingsEvent());
          },
        ),
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
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: height,
          child: Card(
            // This ensures that the Card's children (including the ink splash) are clipped correctly.
            clipBehavior: Clip.antiAlias,
            shape: null,
            child: InkWell(
              onTap: () {
                print('Card was tapped');
              },
              // Generally, material cards use onSurface with 12% opacity for the pressed state.
              splashColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
              // Generally, material cards do not have a highlight overlay.
              highlightColor: Colors.transparent,
              child: Text('abc'),
            ),
          ),
        ),
      ),
    );
  }
}
