import 'package:flutter/material.dart';
import 'package:saadiyat/bookings/index.dart';
import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/my/index.dart';
import 'package:saadiyat/tickets/index.dart';

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
      BookingsPage(),
      TicketsPage(),
      MyPage()
    ];

    return Scaffold(
      body: pages[_currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
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
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
