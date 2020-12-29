import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/app/app_bloc.dart';
import 'package:saadiyat/my/index.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({
    Key key,
  }) : super(key: key);

  @override
  MyScreenState createState() {
    return MyScreenState();
  }
}

class MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBloc, MyState>(builder: (
      BuildContext context,
      MyState currentState,
    ) {
      return BlocBuilder<AppBloc, AppState>(
        builder: (BuildContext context, state) {
          return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: <Widget>[
                GestureDetector(
                    onTap: () => () {},
                    child: Container(
                        height: 160,
                        child: Stack(children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.blueAccent, Colors.blue],
                                  tileMode: TileMode.repeated),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1)),
                              ],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Container(
                              height: 160,
                              alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 20),
                                  Container(
                                      width: 120,
                                      height: 120,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.yellow,
                                          width: 2,
                                        ),
                                        image: DecorationImage(
                                            image: state.user
                                                        ?.avatar['thumbnail'] !=
                                                    null
                                                ? NetworkImage(state
                                                    .user?.avatar['thumbnail'])
                                                : ExactAssetImage(
                                                    'assets/images/user.png')),
                                      )),
                                  SizedBox(width: 20),
                                  Flexible(
                                      child: Container(
                                          height: 160,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Visibility(
                                                visible: !(state.user.first_name
                                                        .isEmpty ||
                                                    state.user.last_name
                                                        .isEmpty),
                                                child: Flexible(
                                                  child: Text(
                                                    '${state.user.first_name} ${state.user.last_name} ',
                                                    softWrap: false,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                  visible: !(state.user
                                                          .first_name.isEmpty ||
                                                      state.user.last_name
                                                          .isEmpty),
                                                  child: SizedBox(
                                                    height: 20,
                                                  )),
                                              Container(
                                                child: Text(
                                                    '${state.user.username}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18)),
                                              )
                                            ],
                                          )))
                                ],
                              ))
                        ]))),
                SizedBox(height: 10),
                RaisedButton(child: Text('SingOut'), onPressed: () {})
              ]);
        },
      );
    });
  }
}
