import 'package:flutter/material.dart';
import 'package:saadiyat/welcome/index.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: WelcomeScreen(),
    );
  }
}
