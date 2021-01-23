import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_state.dart';
import 'package:saadiyat/pages/app/app_event.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:saadiyat/widgets/list_item.dart';
import 'package:auto_route/auto_route.dart';

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
    return BlocBuilder<AppBloc, AppState>(
      builder: (BuildContext context, state) {
        return Stack(
          children: [
            Container(
              height: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    // 顶部栏
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 220.0,
                          color: Colors.white,
                        ),
                        ClipPath(
                          clipper: TopBarClipper(
                              MediaQuery.of(context).size.width, 200.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 200.0,
                            child: Container(
                              width: double.infinity,
                              height: 240.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        // 名字
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Text(
                              state?.user?.name ?? '',
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 60.0),
                          child: Center(
                            child: Text(
                              state?.user?.department ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        // 图标
                        Container(
                          margin: EdgeInsets.only(top: 100.0),
                          child: Center(
                              child: Container(
                            width: 100.0,
                            height: 100.0,
                            child: PreferredSize(
                              child: Container(
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.white,
                                    child: state?.user?.avatar != null &&
                                            state?.user?.avatar['thumbnail'] !=
                                                null
                                        ? CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: state
                                                ?.user?.avatar['thumbnail'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget: (context, url,
                                                    error) =>
                                                Image.asset('assets/user.png'))
                                        : Image.asset('assets/user.png'),
                                  ),
                                ),
                              ),
                              preferredSize: Size(80.0, 80.0),
                            ),
                          )),
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          context.router.push(ProfileRoute());
                        },
                        child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                                elevation: 8,
                                color: Colors.orange,
                                child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Column(children: <Widget>[
                                            ListItem(
                                                icon: Icon(Icons.account_box,
                                                    color: Colors.white),
                                                title: 'Account',
                                                titleColor: Colors.white,
                                                rightWidget: Icon(
                                                    Icons.navigate_next,
                                                    color: Colors.white))
                                          ]))
                                        ]))))),
                    GestureDetector(
                        onTap: () {
                          context.router.push(PassportRoute());
                        },
                        child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                                elevation: 8,
                                color: Colors.red[600],
                                child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Column(children: <Widget>[
                                            ListItem(
                                                icon: Icon(
                                                  FontAwesomeIcons.passport,
                                                  color: Colors.white,
                                                ),
                                                title: 'Passport',
                                                titleColor: Colors.white,
                                                rightWidget: Icon(
                                                  Icons.navigate_next,
                                                  color: Colors.white,
                                                ))
                                          ]))
                                        ]))))),

                    SizedBox(height: 20),
                    Container(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.logout),
                          label: Text('Sign Out'),
                          onPressed: () {
                            BlocProvider.of<AppBloc>(context)
                                .add(AppLogoutEvent(context));
                          },
                        ))
                  ]),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class TopBarClipper extends CustomClipper<Path> {
  // 宽高
  double width;
  double height;

  TopBarClipper(this.width, this.height);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(width, height / 2);
    path.lineTo(0.0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
