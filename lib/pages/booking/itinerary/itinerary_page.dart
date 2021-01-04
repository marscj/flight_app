import 'package:flutter/material.dart';
import 'package:saadiyat/pages/booking/itinerary/index.dart';

class ItineraryPage extends StatefulWidget {
  static const String routeName = '/itinerary';

  ItineraryPage(this.id);

  final int id;

  @override
  _ItineraryPageState createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  @override
  Widget build(BuildContext context) {
    return ItineraryScreen(
      id: widget.id,
    );
  }
}
