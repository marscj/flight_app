import 'package:flutter/material.dart';

import 'my_screen.dart';

class MyPage extends StatefulWidget {
  static const String routeName = 'my';

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        color: Theme.of(context).primaryColor,
        child: MyScreen(),
      ),
    );
  }
}
