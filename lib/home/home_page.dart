import 'package:flutter/material.dart';
import 'package:saadiyat/home/index.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
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
                'assets/logo.png',
                fit: BoxFit.contain,
                height: kToolbarHeight,
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
    );
  }
}
