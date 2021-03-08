import 'package:flutter/material.dart';
import 'package:saadiyat/pages/home/home_page.dart';

class BasementScreen extends StatefulWidget {
  const BasementScreen({
    Key key,
  }) : super(key: key);

  @override
  BasementScreenState createState() {
    return BasementScreenState();
  }
}

class BasementScreenState extends State<BasementScreen> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
