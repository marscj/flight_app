import 'package:flutter/material.dart';
import 'package:saadiyat/widgets/custom_appbar.dart';

import 'about_screen.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = '/about';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('About Us'),
        elevation: 0,
      ),
      body: AboutScreen(),
    );
  }
}
