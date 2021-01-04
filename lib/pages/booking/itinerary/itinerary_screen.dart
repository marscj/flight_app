import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';
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
      return EasyRefresh(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            children: ListTile.divideTiles(
                    tiles: currentState.list.map((f) {
                      return ItineraryItem(data: f);
                    }),
                    color: Theme.of(context).dividerColor)
                .toList(),
          ),
          firstRefresh: currentState.list.length == 0,
          controller: _controller,
          enableControlFinishRefresh: true,
          onRefresh: () async {
            return RestClient()
                .getItinerarys(query: {'booking_id': widget.id}).then((res) {
              bookingsBloc.add(RefreshItineraryEvent(res));
            }).catchError((error) {
              bookingsBloc.add(RefreshItineraryEvent(null));
            }).whenComplete(() {
              _controller.resetLoadState();
              _controller.finishRefresh();
            });
          });
    });
  }
}

class ItineraryItem extends StatelessWidget {
  const ItineraryItem({Key key, this.data}) : super(key: key);

  final Itinerary data;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                data.serial_no ?? '',
                maxLines: 1,
                style: TextStyle(color: Colors.white),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                  title: AutoSizeText(
                    data.serial_no ?? '',
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.yellowAccent),
                      Expanded(
                          child: AutoSizeText(
                        data.remark ?? '',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white54),
                      ))
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Colors.white, size: 30.0))
            ],
          )),
    );
  }
}
