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
  int index = 0;
  @override
  Widget build(BuildContext context) {
    index++;
    print(index);
    print('Itinerary page');
    return ItineraryScreen(
      id: widget.id,
    );
  }
}
