import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/home/index.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(LoadHomeEvent()),
      child: Material(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/header.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Image.asset(
                  'assets/logo-title.png',
                  fit: BoxFit.contain,
                  height: kToolbarHeight - 8,
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    color: Colors.white,
                    onPressed: () {},
                  )
                ],
              ),
              body: HomeScreen(),
            )
          ],
        ),
      ),
    );
  }
}
