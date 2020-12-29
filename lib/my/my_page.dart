import 'package:flutter/material.dart';
import 'package:saadiyat/my/index.dart';

class MyPage extends StatefulWidget {
  static const String routeName = '/my';

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyScreen(),
    );
  }
}
