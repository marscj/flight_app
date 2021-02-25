import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saadiyat/pages/booking_detail/index.dart';
import 'package:saadiyat/widgets/custom_appbar.dart';

import 'booking_screen.dart';
import 'bta_screen.dart';
import 'itinerary_screen.dart';

class BookingDetailPage extends StatefulWidget {
  static const String routeName = '/bookingDetail';

  final int id;

  BookingDetailPage({@PathParam('id') this.id});

  @override
  _BookingDetailPageState createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  onPageChange(index, page) {
    if (page) {
      _pageController.jumpToPage(index);
    } else {
      _tabController.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingDetailBloc>(
        create: (context) => BookingDetailBloc(),
        child: BlocBuilder<BookingDetailBloc, BookingDetailState>(
          builder: (context, state) {
            return Scaffold(
                appBar: CustomAppBar(
                  title: Text('Booking Detail'),
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    onTap: (index) {
                      onPageChange(index, true);
                    },
                    tabs: [
                      Tab(
                        icon: Icon(FontAwesomeIcons.info),
                        child: Text('Info'),
                      ),
                      Tab(
                        icon: Icon(FontAwesomeIcons.fly),
                        child: Text('Itinerary'),
                      ),
                      Tab(
                        icon: Icon(FontAwesomeIcons.file),
                        child: Text('BTA'),
                      ),
                      // Tab(
                      //   icon: badge == 0
                      //       ? Icon(Icons.message)
                      //       : Badge(
                      //           badgeColor: Colors.red,
                      //           position:
                      //               BadgePosition.topStart(top: -12, start: -12),
                      //           badgeContent: Text(
                      //             badge.toString(),
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //           child: Icon(
                      //             Icons.message,
                      //           )),
                      //   child: Text('Message'),
                      // )
                    ],
                  ),
                ),
                body: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    onPageChange(index, false);
                  },
                  children: [
                    BookingScreen(id: widget.id),
                    ItineraryScreen(id: widget.id),
                    BtaScreen(id: widget.id),
                  ],
                ));
          },
        ));
  }
}
