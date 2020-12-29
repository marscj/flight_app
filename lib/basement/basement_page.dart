import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:saadiyat/booking/booking_page.dart';
import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/my/index.dart';
import 'package:saadiyat/ticket/index.dart';

class BasementPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _BasementPageState createState() => _BasementPageState();
}

class _BasementPageState extends State<BasementPage> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  String get restorationId => 'basement';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: const Icon(
            Icons.home,
          ),
          label: 'Home'),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.calendar_today,
        ),
        label: 'Booking',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.local_airport),
        label: 'Ticket',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: 'My',
      )
    ];

    final List<Widget> pages = [
      HomePage(),
      BookingPage(),
      TicketPage(),
      MyPage()
    ];

    return Scaffold(
      body: PageTransitionSwitcher(
        child: pages[_currentIndex.value],
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeThroughTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: textTheme.caption.fontSize,
        unselectedFontSize: textTheme.caption.fontSize,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
