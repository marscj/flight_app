import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/bookings/index.dart';
import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/my/index.dart';
import 'package:saadiyat/tickets/index.dart';

import '../my_flutter_app_icons.dart';

// import 'container_transition.dart';
// import 'fade_scale_transition.dart';
// import 'fade_through_transition.dart';

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

    final List<Widget> pages = [
      HomePage(),
      BookingsPage(),
      TicketsPage(),
      MyPage()
    ];

    // final List<Widget> pages = [
    //   OpenContainerTransformDemo(),
    //   FadeScaleTransitionDemo(),
    //   FadeThroughTransitionDemo(),
    //   SharedAxisTransitionDemo()
    // ];

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()..add(LoadHomeEvent())),
          BlocProvider(
              create: (context) => BookingsBloc()..add(LoadBookingsEvent())),
          BlocProvider(
              create: (context) => TicketsBloc()..add(LoadTicketsEvent())),
          BlocProvider(create: (context) => MyBloc()..add(LoadMyEvent()))
        ],
        child: Scaffold(
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
        ));
  }
}
