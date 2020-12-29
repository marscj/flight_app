import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return SingleChildScrollView(
          child: Column(
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
