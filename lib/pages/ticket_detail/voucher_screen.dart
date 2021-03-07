import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:open_file/open_file.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/widgets/no_data.dart';

import 'ticket_detail_bloc.dart';
import 'ticket_detail_event.dart';
import 'ticket_detail_state.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key key, this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketDetailBloc, TicketDetailState>(builder: (
      BuildContext context,
      TicketDetailState currentState,
    ) {
      // ignore: close_sinks
      TicketDetailBloc bookingDetailBloc =
          BlocProvider.of<TicketDetailBloc>(context);
      return SafeArea(
        child: EasyRefresh(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(currentState?.data?.uploads[index]?.name ?? ''),
                  subtitle:
                      Text(currentState?.data?.uploads[index]?.date ?? ''),
                  onTap: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('loading file...'),
                      ),
                    );
                    DefaultCacheManager()
                        .getSingleFile(currentState?.data?.uploads[index]?.url)
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
              itemCount: currentState?.data?.uploads?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
            emptyWidget: currentState?.data?.uploads?.length == 0
                ? NoDataWidget()
                : null,
            firstRefreshWidget: LinearProgressIndicator(),
            onRefresh: () async {
              await RestClient().getTicket(id).then((res) {
                bookingDetailBloc.add(RefreshTicketDetailEvent(res));
              }).catchError((error) {
                bookingDetailBloc.add(RefreshTicketDetailEvent(null));
              });
            }),
      );
    });
  }
}
