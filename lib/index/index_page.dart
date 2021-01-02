import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/app/app_bloc.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/pages/welcome/index.dart';

class IndexPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => IndexBloc()
          ..add(LoadWelcomeEvent(BlocProvider.of<AppBloc>(context))),
        child: Material(
          child: IndexScreen(),
        ));
  }
}
