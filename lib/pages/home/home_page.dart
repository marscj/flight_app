import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';

import 'home_bloc.dart';
import 'home_event.dart';
import 'home_screen.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            primary: false,
            body: Stack(
              children: [
                _BackGroundView(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: HomeScreen(),
                )
              ],
            ),
          ),
        ));
  }
}

class _BackGroundView extends StatelessWidget {
  const _BackGroundView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/header.jpg', fit: BoxFit.cover);
  }
}
