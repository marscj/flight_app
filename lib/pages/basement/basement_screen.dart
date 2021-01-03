import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/my_flutter_app_icons.dart';
import 'package:saadiyat/pages/bookings/bookings_page.dart';
import 'package:saadiyat/pages/home/home_page.dart';
import 'package:saadiyat/pages/my/my_page.dart';
import 'package:saadiyat/pages/tickets/tickets_page.dart';

import 'basement_bloc.dart';
import 'basement_state.dart';

class BasementScreen extends StatefulWidget {
  const BasementScreen({
    Key key,
  }) : super(key: key);

  @override
  BasementScreenState createState() {
    return BasementScreenState();
  }
}

class BasementScreenState extends State<BasementScreen> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);
  PageController _pageController;

  @override
  String get restorationId => 'basement';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasementBloc, BasementState>(builder: (
      BuildContext context,
      BasementState currentState,
    ) {
      final textTheme = Theme.of(context).textTheme;

      var bottomNavigationBarItems = <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(
              MyFlutterApp.my_home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: const Icon(
            MyFlutterApp.my_booking,
          ),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
          icon: const Icon(MyFlutterApp.my_tickets),
          label: 'Ticket',
        ),
        BottomNavigationBarItem(
          icon: const Icon(MyFlutterApp.my_my),
          label: 'My',
        )
      ];

      return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex.value = index;
            });
          },
          children: [HomePage(), BookingsPage(), TicketsPage(), MyPage()],
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              items: bottomNavigationBarItems,
              currentIndex: _currentIndex.value,
              type: BottomNavigationBarType.shifting,
              selectedFontSize: textTheme.caption.fontSize,
              unselectedFontSize: textTheme.caption.fontSize,
              onTap: (index) {
                setState(() {
                  _currentIndex.value = index;
                  _pageController.jumpToPage(index);
                });
              },
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
            )),
      );
    });
  }
}
