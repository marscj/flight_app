import 'package:flutter/material.dart';
import 'package:saadiyat/pages/support/index.dart';

class SupportPage extends StatefulWidget {
  static const String routeName = '/support';

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
      ),
      body: SupportScreen(),
    );
  }
}
