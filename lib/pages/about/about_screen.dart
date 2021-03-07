import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui show ParagraphBuilder, PlaceholderAlignment;

class AboutScreen extends StatefulWidget {
  @override
  AboutScreenState createState() {
    return AboutScreenState();
  }
}

class AboutScreenState extends State<AboutScreen> {
  AboutScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff000099),
                Color(0xff3300ff),
              ]),
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                      text: 'SAADIYAT WAY TRAVEL & TOURISM',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      children: [
                        WidgetSpan(
                            alignment: ui.PlaceholderAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Image.asset(
                                  'assets/iata.png',
                                  width: 48,
                                  height: 48,
                                )))
                      ]),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text:
                        'SAADIYAT WAY TRAVEL & TOURISM L.L.C was established in 2013. UAE IATA member experienced with corporation clients, has physical office settled in Dubai.',
                    style:
                        TextStyle(color: Colors.white, fontSize: 16, height: 2),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/abg.jpg'),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                      ),
                      Expanded(
                          child: ListView(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: NavTitle(
                                leading: Icon(Icons.phone),
                                title: AutoSizeText(
                                  '00971-4-5762785',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: NavTitle(
                                leading: Icon(Icons.email),
                                title: AutoSizeText(
                                  'ticket@saadiyatway.com',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: NavTitle(
                                leading: Icon(Icons.local_activity),
                                title: AutoSizeText(
                                  'Office 1310  Opal Tower, Business Bay, Dubai U.A.E',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  maxLines: 2,
                                )),
                          )
                        ],
                      ))
                    ],
                  ))),
        ],
      ),
    );
  }
}

class SpaceView extends StatelessWidget {
  const SpaceView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Spacer(
            flex: 1,
          ),
          Expanded(
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Divider(
              color: Colors.black,
            ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

class NavTitle extends StatelessWidget {
  const NavTitle(
      {Key key,
      this.width = 7,
      this.height = 30,
      @required this.title,
      this.leading})
      : super(key: key);

  final double width;
  final double height;
  final Widget title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leading ??
              Container(
                width: width,
                height: height,
                color: Colors.indigo,
              ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: title,
          )
        ],
      ),
    );
  }
}

class BannerView extends StatelessWidget {
  BannerView({this.onPageChanged});

  final Function(int index, CarouselPageChangedReason reason) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.8,
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
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.8)),
        );
      }).toList(),
    );
  }
}
