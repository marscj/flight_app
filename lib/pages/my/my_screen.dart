import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_state.dart';

import 'my_bloc.dart';
import 'my_state.dart';

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
          if (state is InAppState) {
            return SingleChildScrollView(
                child: Column(children: <Widget>[
              GestureDetector(
                  onTap: () => () {},
                  child: Stack(children: <Widget>[
                    Container(
                      height: 160 + MediaQuery.of(context).padding.top,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.indigo, Colors.indigoAccent],
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
                        height: 160 + MediaQuery.of(context).padding.top,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
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
                                      image: state?.user?.avatar != null &&
                                              state?.user
                                                      ?.avatar['thumbnail'] !=
                                                  null
                                          ? NetworkImage(
                                              state?.user?.avatar['thumbnail'])
                                          : ExactAssetImage('assets/user.png')),
                                )),
                            SizedBox(width: 20),
                            Flexible(
                                child: Container(
                                    height: 160 +
                                        MediaQuery.of(context).padding.top,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                          child: Text(
                                            '${state.user}',
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Text(
                                              state?.user?.department ?? '',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                        )
                                      ],
                                    )))
                          ],
                        ))
                  ])),
              SizedBox(height: 10),
              RaisedButton(
                  child: Text('SingOut'),
                  onPressed: () {
                    // BlocProvider.of<AppBloc>(context).add(SignOut());
                  })
            ]));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    });
  }
}
