import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/basement/index.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';
import 'package:saadiyat/welcome/index.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({
    Key key,
  }) : super(key: key);

  @override
  IndexScreenState createState() {
    return IndexScreenState();
  }
}

class IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [WelcomePage(), LoginPage(), BasementPage()];

    return BlocBuilder<IndexBloc, IndexState>(builder: (
      BuildContext context,
      IndexState currentState,
    ) {
      print(currentState.version);
      return PageTransitionSwitcher(
        child: pages[currentState.version],
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeThroughTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
          );
        },
      );
    });
  }
}
