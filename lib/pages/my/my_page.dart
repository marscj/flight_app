import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_state.dart';

import 'my_screen.dart';

class MyPage extends StatefulWidget {
  static const String routeName = 'my';

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        builder: (BuildContext context, state) {
      return Scaffold(
        primary: true,
        appBar: AppBar(
          elevation: 0,
          // title: Text(
          //   state?.user?.name ?? '',
          //   style: TextStyle(fontSize: 24.0, color: Colors.white),
          // ),
        ),
        body: MyScreen(),
      );
    });
  }
}
