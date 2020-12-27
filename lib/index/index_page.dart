import 'package:flutter/material.dart';
import 'package:saadiyat/index/index.dart';

class IndexPage extends StatefulWidget {
  static const String routeName = '/index';

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index'),
      ),
      body: IndexScreen(),
    );
  }
}
