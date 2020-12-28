import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/welcome/index.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key key,
  }) : super(key: key);

  @override
  WelcomeScreenState createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(builder: (
      BuildContext context,
      IndexState currentState,
    ) {
      if (currentState is InWelcomeState) {
        return SafeArea(
          top: true,
          child: SizedBox.expand(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox.fromSize(
                        size: Size.fromHeight(
                            MediaQuery.of(context).size.height / 4),
                        child: Image.asset('assets/logo.png',
                            fit: BoxFit.fitHeight),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: LoadingBouncingGrid.square(
                        backgroundColor: Colors.blueAccent, inverted: true))
              ],
            ),
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
