import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:saadiyat/router/guard.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:platform/platform.dart';
import 'package:saadiyat/constants.dart';

import 'app_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_use_of_visible_for_testing_member

// MethodChannel channel = MethodChannel('jmessage_flutter');

// JmessageFlutter JMessage =
//     new JmessageFlutter.private(channel, const LocalPlatform());

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();

    // JMessage..setDebugMode(enable: true);
    // JMessage.init(isOpenMessageRoaming: true, appkey: Constant.JPUSHKEY);
    // JMessage.applyPushAuthority(
    //     new JMNotificationSettingsIOS(sound: true, alert: true, badge: true));
    // addListener();
    // JMessage.setBadge(badge: 0);

    // ignore: close_sinks
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    appBloc.add(AppInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter(authGuard: AuthGuard(context));

    // 强制竖屏
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return MaterialApp.router(
        title: 'Saadiyat',
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        builder: (context, router) {
          // ignore: close_sinks
          final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

          return BlocListener<AppBloc, AppState>(
              listener: (_, state) {
                if (state.event != null) {
                  appBloc.add(state.event);
                }
              },
              child: FlutterEasyLoading(child: router));
        },
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
          // scaffoldBackgroundColor: Colors.grey[200],
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            },
          ),
          // buttonTheme: ButtonThemeData(
          //     buttonColor: Colors.indigo,
          //     hoverColor: Colors.indigo,
          //     textTheme: ButtonTextTheme.primary),
          // appBarTheme: AppBarTheme(
          //     elevation: 0,
          //     color: Colors.grey[200],
          //     iconTheme: IconThemeData(color: Colors.indigo),
          //     textTheme: GoogleFonts.righteousTextTheme(
          //       Theme.of(context).textTheme.apply(
          //           displayColor: Colors.indigo, bodyColor: Colors.indigo),
          //     ),
          //     brightness: Brightness.light),
          // dividerColor: Colors.grey,
          // textTheme: GoogleFonts.righteousTextTheme(
          //   Theme.of(context).textTheme,
          // ),
          // highlightColor: Colors.blueAccent,
          // hoverColor: Colors.blueAccent.withOpacity(0.04),
          // splashColor: Colors.blueAccent
        ),
      );
    });
  }

  // void addListener() async {
  //   print('add listener receive ReceiveMessage');

  //   JMessage.addReceiveMessageListener((msg) {
  //     //+
  //     print('listener receive event - message ： ${msg.toJson()}');
  //   });

  //   JMessage.addClickMessageNotificationListener((msg) {
  //     print(
  //         'listener receive event - click message notification ： ${msg.toJson()}');
  //   });

  //   JMessage.addSyncOfflineMessageListener((conversation, msgs) {
  //     print('listener receive event - sync office message ');
  //   });

  //   JMessage.addSyncRoamingMessageListener((conversation) {
  //     print('listener receive event - sync roaming message');
  //   });

  //   JMessage.addLoginStateChangedListener((JMLoginStateChangedType type) {
  //     // ignore: unnecessary_brace_in_string_interps
  //     print('listener receive event -  login state change: ${type}');
  //   });

  //   JMessage.addContactNotifyListener((JMContactNotifyEvent event) {
  //     print('listener receive event - contact notify ${event.toJson()}');
  //   });

  //   JMessage.addMessageRetractListener((msg) {
  //     print('listener receive event - message retract event');
  //     print("${msg.toString()}");
  //   });

  //   // JMessage.addReceiveChatRoomMessageListener(chatRoomMsgListenerID,
  //   //     (messageList) {
  //   //   print('listener receive event - chat room message ');
  //   // });

  //   JMessage.addReceiveTransCommandListener((JMReceiveTransCommandEvent event) {
  //     print('listener receive event - trans command');
  //   });

  //   JMessage.addReceiveApplyJoinGroupApprovalListener(
  //       (JMReceiveApplyJoinGroupApprovalEvent event) {
  //     print("listener receive event - apply join group approval");
  //   });

  //   JMessage.addReceiveGroupAdminRejectListener(
  //       (JMReceiveGroupAdminRejectEvent event) {
  //     print('listener receive event - group admin rejected');
  //   });

  //   JMessage.addReceiveGroupAdminApprovalListener(
  //       (JMReceiveGroupAdminApprovalEvent event) {
  //     print('listener receive event - group admin approval');
  //   });

  //   JMessage.addReceiveMessageReceiptStatusChangelistener(
  //       (JMConversationInfo conversation, List<String> serverMessageIdList) {
  //     print("listener receive event - message receipt status change");

  //     //for (var serverMsgId in serverMessageIdList) {
  //     //  JMessage.getMessageByServerMessageId(type: conversation.target, serverMessageId: serverMsgId);
  //     //}
  //   }
  //   );
  // }
}
