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
    return SafeArea(
      top: false,
      child: Scaffold(
        primary: false,
        body: Stack(
          children: [
            _BackGroundView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: HomeScreen(),
            )
          ],
        ),
      ),
    );
  }
}

class _BackGroundView extends StatelessWidget {
  const _BackGroundView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/header.jpg', fit: BoxFit.cover);
  }
}
