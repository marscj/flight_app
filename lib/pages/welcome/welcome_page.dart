import 'package:flutter/material.dart';

import 'welcome_screen.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreen(),
    );
  }
}
