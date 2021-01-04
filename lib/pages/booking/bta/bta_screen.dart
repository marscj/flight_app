import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:saadiyat/apis/client.dart';

import 'bta_bloc.dart';
import 'bta_event.dart';
import 'bta_state.dart';

class BtaScreen extends StatefulWidget {
  const BtaScreen(this.id);

  final int id;

  @override
  BtaScreenState createState() {
    return BtaScreenState();
  }
}

class BtaScreenState extends State<BtaScreen> {
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
    return BlocBuilder<BtaBloc, BtaState>(builder: (
      BuildContext context,
      BtaState currentState,
    ) {
      // ignore: close_sinks
      BtaBloc btaBloc = BlocProvider.of<BtaBloc>(context);
      return EasyRefresh(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(currentState.list[index].name),
              );
            },
            itemCount: currentState?.list?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          ),
          firstRefresh: currentState.list.length == 0,
          controller: _controller,
          enableControlFinishRefresh: true,
          onRefresh: () async {
            return RestClient().getUploads(query: {
              'object_id': widget.id,
              'content_type': 'booking'
            }).then((res) {
              btaBloc.add(RefreshBtaEvent(res));
            }).catchError((error) {
              btaBloc.add(RefreshBtaEvent(null));
            }).whenComplete(() {
              _controller.resetLoadState();
              _controller.finishRefresh();
            });
          });
    });
  }
}
