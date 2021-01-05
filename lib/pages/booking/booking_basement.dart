import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saadiyat/pages/booking/booking/index.dart';
import 'package:saadiyat/pages/booking/bta/index.dart';
import 'package:saadiyat/pages/booking/itinerary/index.dart';

class BookingBasementPage extends StatefulWidget {
  static const String routeName = 'booking';

  BookingBasementPage({@PathParam('id') this.id});

  final int id;

  @override
  _BookingBasementPageState createState() => _BookingBasementPageState();
}

class _BookingBasementPageState extends State<BookingBasementPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  TabController _tabController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BookingBloc()),
          BlocProvider(create: (context) => ItineraryBloc()),
          BlocProvider(create: (context) => BtaBloc())
        ],
        child: Scaffold(
            appBar: AppBar(
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
                BookingPage(widget.id),
                ItineraryPage(widget.id),
                BtaPage(widget.id),
              ],
            )));
  }
}
