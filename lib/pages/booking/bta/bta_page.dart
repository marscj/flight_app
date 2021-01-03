import 'package:flutter/material.dart';
import 'bta_screen.dart';

class BtaPage extends StatefulWidget {
  static const String routeName = '/bta';

  @override
  _BtaPageState createState() => _BtaPageState();
}

class _BtaPageState extends State<BtaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bta'),
      ),
      body: BtaScreen(),
    );
  }
}
