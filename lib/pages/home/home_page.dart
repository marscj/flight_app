import 'package:flutter/material.dart';

import 'home_screen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/header.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
              centerTitle: true,
              title: Image.asset(
                'assets/logo-title.png',
                fit: BoxFit.contain,
                height: kToolbarHeight - 8,
              ),
              actions: [
                // IconButton(
                //   icon: Icon(Icons.notifications),
                //   color: Colors.white,
                //   onPressed: () {},
                // )
              ],
            ),
            body: HomeScreen(),
          )
        ],
      ),
    );
  }
}
