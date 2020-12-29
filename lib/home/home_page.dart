import 'package:flutter/material.dart';
import 'package:saadiyat/home/index.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}
