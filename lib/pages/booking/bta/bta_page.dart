import 'package:flutter/material.dart';
import 'bta_screen.dart';

class BtaPage extends StatefulWidget {
  static const String routeName = '/bta';

  BtaPage(this.id);

  final int id;

  @override
  _BtaPageState createState() => _BtaPageState();
}

class _BtaPageState extends State<BtaPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    index++;
    print(index);
    print('bta page');
    return BtaScreen(widget.id);
  }
}
