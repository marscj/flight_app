import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/booking/booking/booking_event.dart';
import 'package:saadiyat/pages/booking/itinerary/index.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({Key key, @required this.id}) : super(key: key);

  final int id;

  @override
  ItineraryScreenState createState() {
    return ItineraryScreenState();
  }
}

class ItineraryScreenState extends State<ItineraryScreen> {
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItineraryBloc, ItineraryState>(builder: (
      BuildContext context,
      ItineraryState currentState,
    ) {
      // ignore: close_sinks
      ItineraryBloc bookingsBloc = BlocProvider.of<ItineraryBloc>(context);
      return Scaffold(
        appBar: AppBar(
          title: Text('Booking Detail'),
        ),
        body: EasyRefresh(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              children: ListTile.divideTiles(
                      tiles: currentState.list.map((f) {
                        return ListTile(title: Text(f.id.toString()));
                      }),
                      color: Theme.of(context).dividerColor)
                  .toList(),
            ),
            firstRefresh: currentState.list.length == 0,
            controller: _controller,
            enableControlFinishRefresh: true,
            onRefresh: () async {
              return RestClient()
                  .getItinerarys(query: {'object_id': widget.id}).then((res) {
                bookingsBloc.add(RefreshItineraryEvent(res));
              }).catchError((error) {
                bookingsBloc.add(RefreshItineraryEvent(null));
              }).whenComplete(() {
                _controller.resetLoadState();
                _controller.finishRefresh();
              });
            }),
      );
    });
  }
}
