import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 10),
              child: Text(
                'SAADIYAT WAY TRAVEL & TOURISM',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SpaceView(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  "SAADIYAT WAY TRAVEL & TOURISM L.L.C was established in 2013. Dubai Happy Travel International Travel Agency is licensed by the UAE Government, Ministry of Economic Affairs, Tourism Administration, Immigration and other related departments. \nAn international travel agency specializing in travel projects within and outside the UAE, with an online visa system authorized by the Immigration Department. You can apply for various entry visas yourself, and you can sign up quickly."),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Our Services',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SpaceView(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  "World famous car rental | desert sand Hummer | Desert Expedition | Night Sea Cruise | Deep sea fishing | Abu Dhabi Tourism | Burj Khalifa pre-book | fly ticket Research project | hot air balloon | Seven Star Sailing | Hotel Luxury | Yacht Cruise | Helicopter Tour | Aerial Skydiving | Appointment Ferrari World | Theme Park | various hotel restaurant reservations"),
            ),
            BannerView(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Contact Us',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SpaceView(),
            Padding(
                padding: const EdgeInsets.all(10),
                child: NavTitle(
                  leading: Icon(Icons.phone),
                  title: AutoSizeText(
                    '+971 4252 5198',
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: NavTitle(
                  leading: Icon(Icons.email),
                  title: AutoSizeText(
                    'ticket@saadiyatway.com',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: NavTitle(
                  leading: Icon(Icons.local_activity),
                  title: AutoSizeText(
                    'Office 1310  Opal Tower, Business Bay, Dubai U.A.E',
                    maxLines: 2,
                  )),
            )
          ],
        ),
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
