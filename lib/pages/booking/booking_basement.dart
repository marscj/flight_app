import 'package:auto_route/annotations.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saadiyat/pages/booking/booking/index.dart';
import 'package:saadiyat/pages/booking/bta/index.dart';
import 'package:saadiyat/pages/booking/chat/index.dart';
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
  TabController _tabController;

  int badge = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BookingBloc()),
          BlocProvider(create: (context) => ItineraryBloc()),
          BlocProvider(create: (context) => BtaBloc()),
          BlocProvider(create: (context) => ChatBloc())
        ],
        child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              title: Text('Booking Detail'),
              bottom: TabBar(
                controller: _tabController,
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
                  Tab(
                    icon: badge == 0
                        ? Icon(Icons.message)
                        : Badge(
                            badgeColor: Colors.red,
                            position:
                                BadgePosition.topStart(top: -12, start: -12),
                            badgeContent: Text(
                              badge.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            child: Icon(
                              Icons.message,
                            )),
                    child: Text('Message'),
                  )
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                BookingPage(id: widget.id),
                ItineraryPage(),
                BtaPage(),
                ChatPage()
              ],
            )));
  }
}
