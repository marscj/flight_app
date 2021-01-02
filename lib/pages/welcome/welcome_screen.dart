import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/welcome/index.dart';
import 'package:saadiyat/router/router.gr.dart';

import 'welcome_state.dart';

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
    // ignore: close_sinks

    return BlocListener<WelcomeBloc, WelcomeState>(
      listener: (_, state) {
        if (state is InWelcomeState && state.routeInfo != null) {
          state.routeInfo.show(context);
        }
      },
      child: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        // ignore: close_sinks
        WelcomeBloc welcomeBloc = BlocProvider.of<WelcomeBloc>(context);

        if (state is ErrorWelcomeState) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(state.errorMessage ?? 'Error'),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text('reload'),
                  onPressed: () {
                    welcomeBloc.add(LoadWelcomeEvent(context));
                  },
                ),
              ),
            ],
          ));
        }

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
      }),
    );
  }
}
