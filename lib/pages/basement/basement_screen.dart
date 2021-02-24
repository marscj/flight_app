import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/my_flutter_app_icons.dart';
import 'package:saadiyat/pages/bookings/bookings_page.dart';
import 'package:saadiyat/pages/home/home_page.dart';
import 'package:saadiyat/pages/my/my_page.dart';
import 'package:saadiyat/pages/tickets/tickets_page.dart';

import 'basement_bloc.dart';
import 'basement_state.dart';

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
