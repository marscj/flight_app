import 'package:animated_text_kit/animated_text_kit.dart';
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
        return Column(
          children: [
            SizedBox(height: 50),
            SizedBox.fromSize(
                size: Size.fromHeight(MediaQuery.of(context).size.height / 4),
                child: Center(
                  child: ColorizeAnimatedTextKit(
                    repeatForever: true,
                    text: [currentState.hello],
                    textStyle: TextStyle(fontSize: 30.0, fontFamily: "Horizon"),
                    colors: [
                      Colors.blue,
                      Colors.purple,
                      Colors.red,
                    ],
                    textAlign: TextAlign.start,
                  ),
                ))
          ],
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
