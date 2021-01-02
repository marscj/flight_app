import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/welcome/index.dart';

import 'welcome_screen.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (context) => WelcomeBloc()..add(LoadWelcomeEvent(context)),
      child: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}
