import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_state.dart';
import 'package:saadiyat/pages/app/app_event.dart';
import 'package:saadiyat/widgets/list_item.dart';

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
                      color: Theme.of(context).primaryColor,
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
                    // 内容
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                          elevation: 8,
                          child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        ListItem(
                                          title: 'Code',
                                          titleColor: Colors.grey,
                                          describe:
                                              state?.user?.passport_code ??
                                                  'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Type',
                                          titleColor: Colors.grey,
                                          describe:
                                              state?.user?.possport_type ??
                                                  'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'First Name',
                                          titleColor: Colors.grey,
                                          describe: state?.user?.first_name ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Nationality',
                                          titleColor: Colors.grey,
                                          describe: state?.user
                                                  ?.passport_nationality ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Date of birth',
                                          titleColor: Colors.grey,
                                          describe: state
                                                  ?.user?.passport_date_birth ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Date of issue',
                                          titleColor: Colors.grey,
                                          describe: state
                                                  ?.user?.passport_date_issue ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        ListItem(
                                          title: 'No.',
                                          titleColor: Colors.grey,
                                          describe: state?.user?.passport_no ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Issuing authority',
                                          titleColor: Colors.grey,
                                          describe: state?.user
                                                  ?.passport_issuing_authority ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Last Name',
                                          titleColor: Colors.grey,
                                          describe: state?.user?.last_name ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Sex',
                                          titleColor: Colors.grey,
                                          describe: state?.user?.passport_sex ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Place of birth',
                                          titleColor: Colors.grey,
                                          describe: state?.user
                                                  ?.passport_place_birth ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        ),
                                        ListItem(
                                          title: 'Date of expiry',
                                          titleColor: Colors.grey,
                                          describe: state?.user
                                                  ?.passport_date_expiry ??
                                              'unknown',
                                          describeColor: Colors.indigoAccent,
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ))),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      height: 80,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.logout),
                        label: Text('Sign Out'),
                        onPressed: () {
                          BlocProvider.of<AppBloc>(context)
                              .add(AppLogoutEvent(context));
                        },
                      ),
                    )
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
