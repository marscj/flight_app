import 'dart:math' as math;
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:saadiyat/router/router.gr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            brightness: Brightness.dark,
            centerTitle: true,
            title: Image.asset(
              'assets/logo-title.png',
              fit: BoxFit.contain,
              height: kToolbarHeight - 8,
            ),
          ),
          Expanded(
            child: ContentView(120, 40),
          ),
          CopyRightView()
        ],
      );
    });
  }
}

class ContentView extends StatelessWidget {
  final double space;
  final double radius;

  const ContentView(this.space, this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipPath(
      clipper: CardClipper(space, radius),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Column(
          children: [
            NoticeView(space),
            SizedBox(
              height: radius / 2,
            ),
            DashLine(
              color: Colors.grey,
            ),
            SizedBox(
              height: radius / 2,
            ),
            Expanded(child: MenuView()),
            BookingView()
          ],
        ),
      ),
    ));
  }
}

class BookingView extends StatelessWidget {
  const BookingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(
                    'assets/apply.png',
                    fit: BoxFit.fill,
                  )),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 18),
                child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    color: Colors.red,
                    onPressed: () {
                      context.router.push(BookingCreateRoute());
                    },
                    child: Text(
                      'Booking Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(72)))),
              )
            ],
          )),
    );
  }
}

class MenuView extends StatefulWidget {
  MenuView({Key key}) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController()
      ..addListener(() {
        print(_controller.offset);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
            controller: _controller,
            primary: false,
            reverse: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: [
              {
                'icon': 'assets/about.png',
                'text': 'About Us',
                'ontap': () {
                  context.router.push(ProfileRoute());
                }
              },
              {
                'icon': 'assets/my.png',
                'text': 'Settings',
                'ontap': () {
                  context.router.push(MyRoute());
                }
              },
              {
                'icon': 'assets/booking.png',
                'text': 'Bookings',
                'ontap': () {
                  context.router.push(BookingsRoute());
                }
              },
              {
                'icon': 'assets/ticket.png',
                'text': 'Tickets',
                'ontap': () {
                  context.router.push(TicketsRoute());
                }
              },
            ].map((f) {
              return InkWell(
                  onTap: f['ontap'],
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        f['icon'],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(f['text'])
                    ],
                  )));
            }).toList()));
  }
}

class NoticeView extends StatelessWidget {
  final double height;

  const NoticeView(this.height);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, AppState state) {
        return SizedBox.fromSize(
          size: Size.fromHeight(height),
          child: Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0x000099)),
                        gradient: LinearGradient(colors: [
                          Color(0xff000099),
                          Color(0xff3300ff),
                        ]),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))),
                    width: 22,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(text: 'Hi: ', children: [
                                TextSpan(text: state?.user?.name ?? '')
                              ]),
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'You have an ticket confirmed',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                        Positioned(
                          top: 5,
                          right: 0,
                          child: Image.asset(
                            'assets/message.png',
                            width: 24,
                            height: 24,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                  ))
                ],
              )),
        );
      },
    );
  }
}

class CopyRightView extends StatelessWidget {
  const CopyRightView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(text: 'Copyright @2020', children: [
          TextSpan(text: ' Saadiyat Way', style: TextStyle(color: Colors.blue))
        ]),
      ),
    );
  }
}

class DashLine extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;

  const DashLine(
      {this.height = 1, this.color = Colors.black, this.dashWidth = 10.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.maxWidth;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  final double right;
  final double holeRadius;

  CardClipper(this.right, this.holeRadius);

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, right)
      ..arcToPoint(
        Offset(size.width, right + holeRadius),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, right + holeRadius)
      ..arcToPoint(
        Offset(0, right),
        clockwise: false,
        radius: Radius.circular(1),
      );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
