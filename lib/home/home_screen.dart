import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/home/index.dart';
import 'package:saadiyat/index/index.dart';

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
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(builder: (
      BuildContext context,
      IndexState currentState,
    ) {
      if (currentState is InHomeState) {
        return SingleChildScrollView(
          child: Column(
            children: [
              BannerView((index, reson) {
                setState(() {
                  _current = index;
                });
              }),
              DotsIndicator(
                dotsCount: 3,
                position: _current.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  color: Colors.grey,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              )
            ],
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
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
          aspectRatio: 2.35,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          onPageChanged: onPageChanged),
      items: [
        'assets/banner1.png',
        'assets/banner2.png',
        'assets/banner3.png',
      ].map((item) {
        return Container(
          margin: EdgeInsets.all(5.0),
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
