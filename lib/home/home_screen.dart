import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saadiyat/home/index.dart';

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
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (
      BuildContext context,
      HomeState currentState,
    ) {
      if (currentState is UnHomeState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorHomeState) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(currentState.errorMessage ?? 'Error'),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: RaisedButton(
                color: Colors.blue,
                child: Text('reload'),
                onPressed: () {},
              ),
            ),
          ],
        ));
      }
      if (currentState is InHomeState) {
        return Column(
          children: [
            BannerView((index, reson) {
              setState(() {
                _current = index;
              });
            }),
            DotsIndicator(
              dotsCount: 6,
              position: _current.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                color: Colors.grey,
                activeColor: Colors.indigo,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            NavTitle(
                height: 25,
                title: Text(
                  'Apply For Booking',
                  style: TextStyle(fontSize: 16),
                )),
            Flexible(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/apply.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bookings Now Open',
                            style: GoogleFonts.unna(fontSize: 18),
                          ),
                          Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.red,
                            elevation: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Text('Get Started',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            NavTitle(
                height: 25,
                title: Text(
                  'About Us',
                  style: TextStyle(fontSize: 16),
                )),
            Flexible(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/about.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone),
                              AutoSizeText(
                                '+971 4252 5198',
                                style: GoogleFonts.unna(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.email),
                              AutoSizeText(
                                'ticket@saadiyatway.com',
                                style: GoogleFonts.unna(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.local_activity),
                              Expanded(
                                child: AutoSizeText(
                                  'Rm612 Makateb Building Airport Road Deira UAE',
                                  maxLines: 1,
                                  style: GoogleFonts.unna(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class NavTitle extends StatelessWidget {
  const NavTitle(
      {Key key, this.width = 7, this.height = 30, @required this.title})
      : super(key: key);

  final double width;
  final double height;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.indigo,
          ),
          SizedBox(
            width: 8,
          ),
          title
        ],
      ),
    );
  }
}

class BannerView extends StatelessWidget {
  BannerView(this.onPageChanged);

  final Function(int index, CarouselPageChangedReason reason) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.5,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          onPageChanged: onPageChanged),
      items: [
        'assets/banner1.jpg',
        'assets/banner2.jpg',
        'assets/banner3.jpg',
        'assets/banner4.jpg',
        'assets/banner5.jpg',
        'assets/banner6.jpg',
      ].map((item) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.asset(item,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.8)),
        );
      }).toList(),
    );
  }
}
