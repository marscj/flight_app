import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            child: CardView(),
          ),
          CopyRightView()
        ],
      );
    });
  }
}

class CardView extends StatelessWidget {
  const CardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: CardClipper(100, 40),
        child: Card(
          child: Text(
              'abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc'),
        ),
      ),
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
      ..lineTo(0, right + holeRadius)
      ..arcToPoint(
        Offset(0, right),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, right + holeRadius);
    //   ..lineTo(size.width, right + holeRadius)
    //   ..arcToPoint(
    //     Offset(size.width, right),
    //     clockwise: false,
    //     radius: Radius.circular(1),
    //   );

    // path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
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
