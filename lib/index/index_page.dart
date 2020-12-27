import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/index/index.dart';

class IndexPage extends StatefulWidget {
  static const String routeName = '/index';

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => IndexBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Index'),
          ),
          body: IndexScreen(),
        ));
  }
}
