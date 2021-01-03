import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'booking_bloc.dart';
import 'booking_state.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    Key key,
  }) : super(key: key);

  @override
  BookingScreenState createState() {
    return BookingScreenState();
  }
}

class BookingScreenState extends State<BookingScreen> {
  int selectedIndex = 0;
  int badge = 0;
  double gap = 10;

  PageController controller;

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
    return BlocBuilder<BookingBloc, BookingState>(builder: (
      BuildContext context,
      BookingState currentState,
    ) {
      return Scaffold(
        extendBody: true,
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(
            'GoogleNavBar',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
              badge = badge + 1;
            });
          },
          controller: controller,
          itemBuilder: (context, position) {
            return Container(
              color: Colors.teal,
            );
          },
          itemCount: 4, // Can be null
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
              padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
              child: GNav(
                  curve: Curves.easeOutExpo,
                  duration: Duration(milliseconds: 900),
                  tabs: [
                    GButton(
                      gap: gap,
                      iconActiveColor: Colors.purple,
                      iconColor: Colors.black,
                      textColor: Colors.purple,
                      backgroundColor: Colors.purple.withOpacity(.2),
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      icon: FontAwesomeIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      gap: gap,
                      iconActiveColor: Colors.pink,
                      iconColor: Colors.black,
                      textColor: Colors.pink,
                      backgroundColor: Colors.pink.withOpacity(.2),
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      icon: FontAwesomeIcons.heart,
                      leading: selectedIndex == 1 || badge == 0
                          ? null
                          : Badge(
                              badgeColor: Colors.red.shade100,
                              elevation: 0,
                              position:
                                  BadgePosition.topStart(top: -12, start: -12),
                              badgeContent: Text(
                                badge.toString(),
                                style: TextStyle(color: Colors.red.shade900),
                              ),
                              child: Icon(
                                FontAwesomeIcons.heart,
                                color: selectedIndex == 1
                                    ? Colors.pink
                                    : Colors.black,
                              )),
                      text: 'Likes',
                    ),
                    GButton(
                      gap: gap,
                      iconActiveColor: Colors.amber[600],
                      iconColor: Colors.black,
                      textColor: Colors.amber[600],
                      backgroundColor: Colors.amber[600].withOpacity(.2),
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      icon: FontAwesomeIcons.search,
                      text: 'Search',
                    ),
                    GButton(
                      gap: gap,
                      iconActiveColor: Colors.teal,
                      iconColor: Colors.black,
                      textColor: Colors.teal,
                      backgroundColor: Colors.teal.withOpacity(.2),
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      icon: FontAwesomeIcons.user,
                      leading: CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                              "https://sooxt98.space/content/images/size/w100/2019/01/profile.png")),
                      text: 'Sheldon',
                    )
                  ],
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.jumpToPage(index);
                  }),
            ),
          ),
        ),
      );
    });
  }
}
