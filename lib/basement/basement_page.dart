import 'package:flutter/material.dart';
import 'package:saadiyat/basement/index.dart';

class BasementPage extends StatefulWidget {
  static const String routeName = '/basement';

  @override
  _BasementPageState createState() => _BasementPageState();
}

class _BasementPageState extends State<BasementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basement'),
      ),
      body: BasementScreen(),
    );
  }
}
