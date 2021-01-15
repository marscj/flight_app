import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_state.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:auto_route/auto_route.dart';

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
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return BlocListener<AppBloc, AppState>(
      listener: (_, state) {
        var event = state.event;

        if (event != null) {
          appBloc.add(event);
          if (event is ErrorEvent) {
            Scaffold.of(_)
                .showSnackBar(SnackBar(content: Text(event.errorMessage)));
          } else if (event is PushRouteEvent) {
            _.router.replace(event.pageRouteInfo);
          }
        }
      },
      child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
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
