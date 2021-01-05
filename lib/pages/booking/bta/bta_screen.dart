import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:open_file/open_file.dart';
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
                title: Text(currentState?.list[index]?.name ?? ''),
                subtitle: Text(currentState?.list[index]?.date ?? ''),
                onTap: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('loading file...'),
                    ),
                  );
                  DefaultCacheManager()
                      .getSingleFile(currentState?.list[index]?.url)
                      .then((file) {
                    if (file != null) {
                      OpenFile.open(file.path);
                    }
                  }).catchError((error) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('download failed!'),
                      ),
                    );
                  });
                },
              );
            },
            itemCount: currentState?.list?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          ),
          firstRefresh: currentState?.list?.length == 0 ?? 0,
          firstRefreshWidget: LinearProgressIndicator(),
          onRefresh: () async {
            return RestClient().getUploads(
                query: {'object_id': widget.id, 'type': 'booking'}).then((res) {
              btaBloc.add(RefreshBtaEvent(res));
            }).catchError((error) {
              btaBloc.add(RefreshBtaEvent(null));
            });
          });
    });
  }
}
