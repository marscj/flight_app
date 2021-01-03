import 'package:auto_route/annotations.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
    with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);
  int badge = 10;

  PageController controller;

  @override
  String get restorationId => 'basement';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
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
          body: PageView(
            onPageChanged: (page) {
              setState(() {
                _currentIndex.value = page;
              });
            },
            controller: controller,
            children: [
              BookingPage(id: widget.id),
              ItineraryPage(),
              BtaPage(),
              ChatPage()
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: -10,
                        blurRadius: 60,
                        color: Colors.black.withOpacity(.4),
                        offset: Offset(0, 25))
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
                child: GNav(
                    curve: Curves.easeOutExpo,
                    duration: Duration(milliseconds: 900),
                    tabs: [
                      GButton(
                        gap: 10,
                        iconActiveColor: Theme.of(context).primaryColor,
                        iconColor: Colors.black,
                        textColor: Theme.of(context).primaryColor,
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(.2),
                        iconSize: 24,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        icon: FontAwesomeIcons.info,
                        text: 'Booking',
                      ),
                      GButton(
                        gap: 10,
                        iconActiveColor: Theme.of(context).primaryColor,
                        iconColor: Colors.black,
                        textColor: Theme.of(context).primaryColor,
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(.2),
                        iconSize: 24,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        icon: FontAwesomeIcons.calendar,
                        text: 'Itinerary',
                      ),
                      GButton(
                        gap: 10,
                        iconActiveColor: Theme.of(context).primaryColor,
                        iconColor: Colors.black,
                        textColor: Theme.of(context).primaryColor,
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(.2),
                        iconSize: 24,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        icon: FontAwesomeIcons.file,
                        text: 'BTA',
                      ),
                      GButton(
                        gap: 10,
                        iconActiveColor: Theme.of(context).primaryColor,
                        iconColor: Colors.black,
                        textColor: Theme.of(context).primaryColor,
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(.2),
                        iconSize: 24,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        icon: FontAwesomeIcons.speakap,
                        text: 'Chat',
                        leading: _currentIndex.value == 3 || badge == 0
                            ? null
                            : Badge(
                                badgeColor: Colors.red.shade100,
                                elevation: 0,
                                position: BadgePosition.topStart(
                                    top: -12, start: -12),
                                badgeContent: Text(
                                  badge.toString(),
                                  style: TextStyle(color: Colors.red.shade900),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.file,
                                  color: _currentIndex.value == 1
                                      ? Colors.pink
                                      : Colors.black,
                                )),
                      )
                    ],
                    selectedIndex: _currentIndex.value,
                    onTabChange: (index) {
                      setState(() {
                        _currentIndex.value = index;
                      });
                      controller.jumpToPage(index);
                    }),
              ),
            ),
          ),
        ));
  }
}
