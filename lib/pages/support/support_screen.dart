import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/support/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/widgets/ifnone_widget.dart';

// ignore_for_file: close_sinks

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key key, @required this.data}) : super(key: key);

  final Ticket data;

  @override
  SupportScreenState createState() {
    return SupportScreenState();
  }
}

class SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportBloc, SupportState>(
      builder: (context, state) {
        SupportBloc bloc = BlocProvider.of<SupportBloc>(context);

        return Scaffold(
            appBar: AppBar(title: Text('Support Center')),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showCommentModal(context, widget.data.id, 'ticket');
              },
            ),
            body: EasyRefresh(
                firstRefresh: true,
                firstRefreshWidget: LinearProgressIndicator(),
                onRefresh: () async {
                  await RestClient().getComments(query: {
                    'content_type': 'ticket',
                    'object_id': widget.data.id
                  }).then((res) {
                    bloc.add(RefreshSupportDetailEvent(res.data));
                  }).catchError((error) {});
                },
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (c, i) => Container(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                                image: DecorationImage(
                                    image: state.list[i].user
                                                ?.avatar['thumbnail'] !=
                                            null
                                        ? NetworkImage(state
                                            .list[i].user?.avatar['thumbnail'])
                                        : ExactAssetImage('assets/user.png')),
                              )),
                          title: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(fontSize: 18),
                                    text: state.list[i].content),
                                TextSpan(text: '\n'),
                                TextSpan(
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(color: Colors.grey[600]),
                                    text:
                                        '${state.list[i].user.name}  ${state.list[i].date}'),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.reply),
                            onPressed: () {
                              showCommentModal(
                                      context, state.list[i].id, 'comment',
                                      reply: state.list[i])
                                  .then((value) {
                                if (value != null && value) {}
                              });
                            },
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 16),
                            child: ListBody(
                              children: state.list[i].child.map((e) {
                                return ListTile(
                                    isThreeLine: true,
                                    dense: true,
                                    leading: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32)),
                                          image: DecorationImage(
                                              image: state.list[i].user?.avatar[
                                                          'thumbnail'] !=
                                                      null
                                                  ? NetworkImage(state
                                                      .list[i]
                                                      .user
                                                      ?.avatar['thumbnail'])
                                                  : ExactAssetImage(
                                                      'assets/images/user.png')),
                                        )),
                                    title: Text('${e.content}'),
                                    subtitle:
                                        Text('${e.user.name}  ${e.date}'));
                              }).toList(),
                            ))
                      ],
                    ),
                  ),
                  itemCount: state.list.length,
                )));
      },
    );
  }
}

class SupportPostPage extends StatefulWidget {
  final int objectid;
  final String contenttype;
  final Comment reply;

  const SupportPostPage({Key key, this.objectid, this.contenttype, this.reply})
      : super(key: key);

  @override
  _SupportPostPageState createState() => _SupportPostPageState();
}

class _SupportPostPageState extends State<SupportPostPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentFormBloc>(
        create: (_) =>
            CommentFormBloc(context, widget.objectid, widget.contenttype),
        child: Builder(
          builder: (context) {
            CommentFormBloc formBloc =
                BlocProvider.of<CommentFormBloc>(context);
            return FormBlocListener<CommentFormBloc, String, String>(
              onSubmitting: (context, state) {},
              onSuccess: (context, state) {
                context.router.pop();
              },
              onFailure: (context, state) {},
              child: Scaffold(
                body: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    IfNoneWidget(
                      basis: widget.reply != null,
                      builder: (context) {
                        return ListBody(
                          children: [
                            SizedBox(height: 10),
                            ListTile(
                              leading: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32)),
                                    image: DecorationImage(
                                        image: widget.reply.user
                                                    ?.avatar['thumbnail'] !=
                                                null
                                            ? NetworkImage(widget.reply.user
                                                ?.avatar['thumbnail'])
                                            : ExactAssetImage(
                                                'assets/images/user.png')),
                                  )),
                              title: Text(widget.reply.content),
                              subtitle: Text(
                                '${widget.reply.user.name}  ${widget.reply.date}',
                              ),
                            ),
                          ],
                        );
                      },
                      none: ListBody(
                        children: [
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFieldBlocBuilder(
                      textFieldBloc: formBloc.content,
                      textInputAction: TextInputAction.send,
                      maxLines: 3,
                      maxLength: 256,
                      decoration: InputDecoration(
                          labelText: 'Content', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        formBloc.submit();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

Future<T> showCommentModal<T>(BuildContext context, objectid, contenttype,
    {reply}) async {
  return showModalBottomSheet<T>(
      context: context,
      builder: (BuildContext context) {
        return SupportPostPage(
            objectid: objectid, contenttype: contenttype, reply: reply);
      });
}
