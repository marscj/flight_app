// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jpush_flutter/jpush_flutter.dart';
// import 'package:saadiyat/pages/app/app_bloc.dart';
// import 'package:saadiyat/pages/app/app_event.dart';
// import 'package:saadiyat/pages/app/app_page.dart';

// void main() {
//   runApp(BlocProvider(
//       create: (context) => AppBloc()..add(UnAppEvent(context)), child: App()));
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:jpush_flutter/jpush_flutter.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String debugLable = 'Unknown';
//   final JPush jpush = new JPush();

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;

//     try {
//       jpush.addEventHandler(
//           onReceiveNotification: (Map<String, dynamic> message) async {
//         print("flutter onReceiveNotification: $message");
//         setState(() {
//           debugLable = "flutter onReceiveNotification: $message";
//         });
//       }, onOpenNotification: (Map<String, dynamic> message) async {
//         print("flutter onOpenNotification: $message");
//         setState(() {
//           debugLable = "flutter onOpenNotification: $message";
//         });
//       }, onReceiveMessage: (Map<String, dynamic> message) async {
//         print("flutter onReceiveMessage: $message");
//         setState(() {
//           debugLable = "flutter onReceiveMessage: $message";
//         });
//       }, onReceiveNotificationAuthorization:
//               (Map<String, dynamic> message) async {
//         print("flutter onReceiveNotificationAuthorization: $message");
//         setState(() {
//           debugLable = "flutter onReceiveNotificationAuthorization: $message";
//         });
//       });
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }

//     jpush.setup(
//       appKey: "001486b3ce6d38e6c013530f", //你自己应用的 AppKey
//       channel: "theChannel",
//       production: false,
//       debug: true,
//     );
//     jpush.applyPushAuthority(
//         new NotificationSettingsIOS(sound: true, alert: true, badge: true));

//     // Platform messages may fail, so we use a try/catch PlatformException.
//     jpush.getRegistrationID().then((rid) {
//       print("flutter get registration id : $rid");
//       setState(() {
//         debugLable = "flutter getRegistrationID: $rid";
//       });
//     });

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       debugLable = platformVersion;
//     });
//   }

// // 编写视图
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: new Center(
//             child: new Column(children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//             color: Colors.brown,
//             child: Text(debugLable ?? "Unknown"),
//             width: 350,
//             height: 100,
//           ),
//           new Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 new Text(" "),
//                 new CustomButton(
//                     title: "发本地推送",
//                     onPressed: () {
//                       // 三秒后出发本地推送
//                       var fireDate = DateTime.fromMillisecondsSinceEpoch(
//                           DateTime.now().millisecondsSinceEpoch + 3000);
//                       var localNotification = LocalNotification(
//                           id: 234,
//                           title: 'fadsfa',
//                           buildId: 1,
//                           content: 'fdas',
//                           fireTime: fireDate,
//                           subtitle: 'fasf',
//                           badge: 5,
//                           extra: {"fa": "0"});
//                       jpush
//                           .sendLocalNotification(localNotification)
//                           .then((res) {
//                         setState(() {
//                           debugLable = res;
//                         });
//                       });
//                     }),
//                 new Text(" "),
//                 new CustomButton(
//                     title: "getLaunchAppNotification",
//                     onPressed: () {
//                       jpush.getLaunchAppNotification().then((map) {
//                         print("flutter getLaunchAppNotification:$map");
//                         setState(() {
//                           debugLable = "getLaunchAppNotification success: $map";
//                         });
//                       }).catchError((error) {
//                         setState(() {
//                           debugLable = "getLaunchAppNotification error: $error";
//                         });
//                       });
//                     }),
//               ]),
//           new Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 new Text(" "),
//                 new CustomButton(
//                     title: "setTags",
//                     onPressed: () {
//                       jpush.setTags(["lala", "haha"]).then((map) {
//                         var tags = map['tags'];
//                         setState(() {
//                           debugLable = "set tags success: $map $tags";
//                         });
//                       }).catchError((error) {
//                         setState(() {
//                           debugLable = "set tags error: $error";
//                         });
//                       });
//                     }),
//                 new Text(" "),
//                 new CustomButton(
//                     title: "addTags",
//                     onPressed: () {
//                       jpush.addTags(["lala", "haha"]).then((map) {
//                         var tags = map['tags'];
//                         setState(() {
//                           debugLable = "addTags success: $map $tags";
//                         });
//                       }).catchError((error) {
//                         setState(() {
//                           debugLable = "addTags error: $error";
//                         });
//                       });
//                     }),
//                 new Text(" "),
//                 new CustomButton(
//                     title: "deleteTags",
//                     onPressed: () {
//                       jpush.deleteTags(["lala", "haha"]).then((map) {
//                         var tags = map['tags'];
//                         setState(() {
//                           debugLable = "deleteTags success: $map $tags";
//                         });
//                       }).catchError((error) {
//                         setState(() {
//                           debugLable = "deleteTags error: $error";
//                         });
//                       });
//                     }),
//               ]),
//           new Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 new Text(" "),
//                 new CustomButton(
//                     title: "getAllTags",
//                     onPressed: () {
//                       jpush.getAllTags().then((map) {
//                         setState(() {
//                           debugLable = "getAllTags success: $map";
//                         });
//                       }).catchError((error) {
//                         setState(() {
//                           debugLable = "getAllTags error: $error";
//                         });
//                       });
//                     }),
//                 new Text(" "),
//                 new CustomButton(
//                     title: "cleanTags",
//                     onPressed: () {
//                       jpush.cleanTags().then((map) {
//                         var tags = map['tags'];
//                         setState(() {
//                           debugLable = "cleanTags success: $map $tags";
//                         });
//                       }).catchError((error) {
//                         setState(() {
//                           debugLable = "cleanTags error: $error";
//                         });
//                       });
//                     }),
//               ]),
//           new Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 new Text(" "),
//                 new CustomButton(
//                     title: "setAlias",
//                     onPressed: () {
//                       jpush.setAlias("test1@test.com").then((map) {
//                         setState(() {
//                           debugLable = "setAlias success: $map";
//                         });
//                       }).catchError((error) {
//                         setState(() {
//                           debugLable = "setAlias error: $error";
//                         });
//                       });
//                     }),
//                 new Text(" "),
//                 new CustomButton(
//                     title: "deleteAlias",
//                     onPressed: () {
//                       jpush.deleteAlias().then((map) {
//                         setState(() {
//                           debugLable = "deleteAlias success: $map";
//                         });
//                       }).catchError((error) {
//                         setState(() {
//                           debugLable = "deleteAlias error: $error";
//                         });
//                       });
//                     }),
//               ]),
//           new Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(" "),
//               new CustomButton(
//                   title: "stopPush",
//                   onPressed: () {
//                     jpush.stopPush();
//                   }),
//               new Text(" "),
//               new CustomButton(
//                   title: "resumePush",
//                   onPressed: () {
//                     jpush.resumePush();
//                   }),
//             ],
//           ),
//           new Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(" "),
//               new CustomButton(
//                   title: "clearAllNotifications",
//                   onPressed: () {
//                     jpush.clearAllNotifications();
//                   }),
//               new Text(" "),
//               new CustomButton(
//                   title: "setBadge",
//                   onPressed: () {
//                     jpush.setBadge(66).then((map) {
//                       setState(() {
//                         debugLable = "setBadge success: $map";
//                       });
//                     }).catchError((error) {
//                       setState(() {
//                         debugLable = "setBadge error: $error";
//                       });
//                     });
//                   }),
//             ],
//           ),
//           new Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(" "),
//               new CustomButton(
//                   title: "通知授权是否打开",
//                   onPressed: () {
//                     jpush.isNotificationEnabled().then((bool value) {
//                       setState(() {
//                         debugLable = "通知授权是否打开: $value";
//                       });
//                     }).catchError((onError) {
//                       setState(() {
//                         debugLable = "通知授权是否打开: ${onError.toString()}";
//                       });
//                     });
//                   }),
//               new Text(" "),
//               new CustomButton(
//                   title: "打开系统设置",
//                   onPressed: () {
//                     jpush.openSettingsForNotification();
//                   }),
//             ],
//           ),
//         ])),
//       ),
//     );
//   }
// }

// /// 封装控件
// class CustomButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String title;

//   const CustomButton({@required this.onPressed, @required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return new FlatButton(
//       onPressed: onPressed,
//       child: new Text("$title"),
//       color: Color(0xff585858),
//       highlightColor: Color(0xff888888),
//       splashColor: Color(0xff888888),
//       textColor: Colors.white,
//       //padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:platform/platform.dart';

import 'package:image_picker/image_picker.dart';

import 'conversation_manage_view.dart';
import 'group_manage_view.dart';

const String kMockAppkey = "001486b3ce6d38e6c013530f"; //'你自己应用的 AppKey';
const String kMockUserName = 'test1';
const String kMockPassword = 'admin123';
const String kCommonPassword = 'admin123';

const String kMockGroupName = 'test';
const String kMockGroupDesc = 'TESTGroupDecs';

const String kMockTargetUserName = 'test2';

// Target test data
final JMSingle kMockUser =
    JMSingle.fromJson({'username': kMockTargetUserName, 'appKey': kMockAppkey});

const String kMockGroupId = '46828852';
final JMGroup kMockGroup =
    JMGroup.fromJson({'type': JMGroupType.private, 'groupId': kMockGroupId});

const String kMockChatRoomid = '25149077';
final JMChatRoom kMockChatRoom =
    JMChatRoom.fromJson({'roomId': kMockChatRoomid});

MethodChannel channel = MethodChannel('jmessage_flutter');
JmessageFlutter jmessage =
    new JmessageFlutter.private(channel, const LocalPlatform());

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

// 我要展示的 home page 界面，这是个有状态的 widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _platformVersion = 'Unknown';
  final String flutter_log = "| Example | Flutter | ";

  @override
  void initState() {
    super.initState();
    print(flutter_log + "demo manin init state");
    // initPlatformState();

    jmessage..setDebugMode(enable: true);
    jmessage.init(isOpenMessageRoaming: true, appkey: kMockAppkey);
    jmessage.applyPushAuthority(
        new JMNotificationSettingsIOS(sound: true, alert: true, badge: true));
    addListener();
  }

  void demoShowMessage(bool isShow, String msg) {
    setState(() {
      _loading = isShow;
      _result = msg ?? "";
    });
  }

  void demoRegisterAction() async {
    print(flutter_log + "registerAction : " + usernameTextEC1.text);

    setState(() {
      _loading = true;
    });

    if (usernameTextEC1.text == null || usernameTextEC1.text == "") {
      setState(() {
        _loading = false;
        _result = "【注册】username 不能为空";
      });
      return;
    }
    String name = usernameTextEC1.text;

    await jmessage.userRegister(
        username: name, password: kCommonPassword, nickname: name);

    setState(() {
      _loading = false;
    });
  }

  void demoLoginUserAction() async {
    print(flutter_log + "loginUserAction : " + usernameTextEC1.text);

    setState(() {
      _loading = true;
    });

    if (usernameTextEC1.text == null || usernameTextEC1.text == "") {
      setState(() {
        _loading = false;
        _result = "【登录】username 不能为空";
      });
      return;
    }
    String name = usernameTextEC1.text;
    await jmessage.login(username: name, password: kCommonPassword).then(
        (onValue) {
      setState(() {
        _loading = false;
        if (onValue is JMUserInfo) {
          JMUserInfo u = onValue;
          _result = "【登录后】${u.toJson()}";
        } else {
          _result = "【登录后】null}";
        }
      });
    }, onError: (error) {
      setState(() {
        _loading = false;
        if (error is PlatformException) {
          PlatformException ex = error;
          _result = "【登录后】code = ${ex.code},message = ${ex.message}";
        } else {
          _result = "【登录后】code = ${error.toString()}";
        }
      });
    });
  }

  void demoLogoutAction() async {
    print(flutter_log + "demoLogoutAction : ");

    setState(() {
      _loading = true;
    });

    await jmessage.logout().then((onValue) {
      print(flutter_log + "demoLogoutAction : then");
      demoShowMessage(false, "【已退出】");
    }, onError: (onError) {
      print(flutter_log + "demoLogoutAction : onError $onError");
      demoShowMessage(false, onError.toString());
    });
  }

  void demoGetCurrentUserInfo() async {
    print(flutter_log + "demoGetCurrentUserInfo : ");

    setState(() {
      _loading = true;
    });
    JMUserInfo u = await jmessage.getMyInfo();

    setState(() {
      _loading = false;
      if (u == null) {
        _result = " ===== 您还未登录账号 ===== \n【获取登录用户信息】null";
      } else {
        _result = " ===== 您已经登录 ===== \n【获取登录用户信息】${u.toJson()}";
      }
    });
  }

  void demoSendTextMessage() async {
    print(flutter_log + "demoSendTextMessage " + usernameTextEC2.text);

    setState(() {
      _loading = true;
    });

    if (usernameTextEC2.text == null || usernameTextEC2.text == "") {
      setState(() {
        _loading = false;
        _result = "【发消息】对方 username 不能为空";
      });
      return;
    }
    String name = usernameTextEC2.text;
    int textIndex = DateTime.now().millisecondsSinceEpoch;

    JMSingle type = JMSingle.fromJson({"username": name});
    JMMessageSendOptions option =
        JMMessageSendOptions.fromJson({"needReadReceipt": true});
    JMTextMessage msg = await jmessage.sendTextMessage(
        type: type,
        text: "send msg current time: $textIndex",
        sendOption: option);
    setState(() {
      _loading = false;
      String messageString = "【文本消息】${msg.toJson()}";
      _result = messageString;
      print(flutter_log + messageString);
    });
  }

  void demoSendImageMessage() async {
    print(flutter_log + "demoSendImageMessage " + usernameTextEC2.text);

    setState(() {
      _loading = true;
    });
    if (usernameTextEC2.text == null || usernameTextEC2.text == "") {
      setState(() {
        _loading = false;
        _result = "【发消息】对方 username 不能为空";
      });
      return;
    }
    String username = usernameTextEC2.text;

    PickedFile selectImageFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    JMSingle type = JMSingle.fromJson({"username": username});
    JMImageMessage msg =
        await jmessage.sendImageMessage(type: type, path: selectImageFile.path);

    setState(() {
      _loading = false;
      _result = "【图片消息】${msg.toJson()}";
    });
  }

  void demoSendLocationMessage() async {
    print(flutter_log + "demoSendLocationMessage " + usernameTextEC2.text);

    setState(() {
      _loading = true;
    });

    if (usernameTextEC2.text == null || usernameTextEC2.text == "") {
      setState(() {
        _loading = false;
        _result = "【发消息】对方 username 不能为空";
      });
      return;
    }
    String username = usernameTextEC2.text;

    JMSingle type = JMSingle.fromJson({"username": username});
    JMLocationMessage msg = await jmessage.sendLocationMessage(
        type: type,
        latitude: 100.0,
        longitude: 200.0,
        scale: 1,
        address: "详细地址");
    setState(() {
      _loading = false;
      _result = "【地理位置消息】${msg.toJson()}";
    });
  }

  static final String chatRoomMsgListenerID =
      "chatRoomMsgListenerID"; //监听聊天室消息的监听id
  static final String receiveMsgListenerID = "receiveMsgListenerID"; //监听消息的监听id

  void removeListener() async {
    jmessage.removeReceiveChatRoomMessageListener(chatRoomMsgListenerID);
  }

  void addListener() async {
    print('add listener receive ReceiveMessage');

    jmessage.addReceiveMessageListener((msg) {
      //+
      print('listener receive event - message ： ${msg.toJson()}');

      /* 下载原图测试
      if (msg is JMImageMessage) {
        print('收到一条图片消息' + 'id='+ msg.id + ',serverMessageId='+msg.serverMessageId);
        print('开始下载图片消息的原图');
        jmessage.downloadOriginalImage(target: msg.from, messageId: msg.id).then((value) {
          print('下载图片--回调-1');
          print('图片消息，filePath = ' + value['filePath']);
          print('图片消息，messageId = ' + value['messageId'].toString());
          print('下载图片--回调-2');
        });
      }
       */

      setState(() {
        _result = "【收到消息】${msg.toJson()}";
      });
    });

    jmessage.addClickMessageNotificationListener((msg) {
      //+
      print(
          'listener receive event - click message notification ： ${msg.toJson()}');
    });

    jmessage.addSyncOfflineMessageListener((conversation, msgs) {
      print('listener receive event - sync office message ');

      List<Map> list = [];
      for (JMNormalMessage msg in msgs) {
        print('offline msg: ${msg.toJson()}');
        list.add(msg.toJson());
      }

      setState(() {
        _result = "【离线消息】${list.toString()}";
      });
    });

    jmessage.addSyncRoamingMessageListener((conversation) {
      verifyConversation(conversation);
      print('listener receive event - sync roaming message');
    });

    jmessage.addLoginStateChangedListener((JMLoginStateChangedType type) {
      print('listener receive event -  login state change: ${type}');
    });

    jmessage.addContactNotifyListener((JMContactNotifyEvent event) {
      print('listener receive event - contact notify ${event.toJson()}');
    });

    jmessage.addMessageRetractListener((msg) {
      print('listener receive event - message retract event');
      print("${msg.toString()}");
      verifyMessage(msg);
    });

    jmessage.addReceiveChatRoomMessageListener(chatRoomMsgListenerID,
        (messageList) {
      print('listener receive event - chat room message ');
    });

    jmessage.addReceiveTransCommandListener((JMReceiveTransCommandEvent event) {
      expect(event.message, isNotNull,
          reason: 'JMReceiveTransCommandEvent.message is null');
      expect(event.sender, isNotNull,
          reason: 'JMReceiveTransCommandEvent.sender is null');
      expect(event.receiver, isNotNull,
          reason: 'JMReceiveTransCommandEvent.receiver is null');
      expect(event.receiverType, isNotNull,
          reason: 'JMReceiveTransCommandEvent.receiverType is null');
      print('listener receive event - trans command');
    });

    jmessage.addReceiveApplyJoinGroupApprovalListener(
        (JMReceiveApplyJoinGroupApprovalEvent event) {
      print("listener receive event - apply join group approval");

      expect(event.eventId, isNotNull,
          reason: 'JMReceiveApplyJoinGroupApprovalEvent.eventId is null');
      expect(event.groupId, isNotNull,
          reason: 'JMReceiveApplyJoinGroupApprovalEvent.groupId is null');
      expect(event.isInitiativeApply, isNotNull,
          reason:
              'JMReceiveApplyJoinGroupApprovalEvent.isInitiativeApply is null');
      expect(event.sendApplyUser, isNotNull,
          reason: 'JMReceiveApplyJoinGroupApprovalEvent.sendApplyUser is null');
      expect(event.joinGroupUsers, isNotNull,
          reason:
              'JMReceiveApplyJoinGroupApprovalEvent.joinGroupUsers is null');
      expect(event.reason, isNotNull,
          reason: 'JMReceiveApplyJoinGroupApprovalEvent.reason is null');
      print('flutter receive event receive apply jocin group approval');
    });

    jmessage.addReceiveGroupAdminRejectListener(
        (JMReceiveGroupAdminRejectEvent event) {
      expect(event.groupId, isNotNull,
          reason: 'JMReceiveGroupAdminRejectEvent.groupId is null');
      verifyUser(event.groupManager);
      expect(event.reason, isNotNull,
          reason: 'JMReceiveGroupAdminRejectEvent.reason is null');
      print('listener receive event - group admin rejected');
    });

    jmessage.addReceiveGroupAdminApprovalListener(
        (JMReceiveGroupAdminApprovalEvent event) {
      expect(event.isAgree, isNotNull,
          reason: 'addReceiveGroupAdminApprovalListener.isAgree is null');
      expect(event.applyEventId, isNotNull,
          reason: 'addReceiveGroupAdminApprovalListener.applyEventId is null');
      expect(event.groupId, isNotNull,
          reason: 'addReceiveGroupAdminApprovalListener.groupId is null');

      expect(event.isAgree, isNotNull,
          reason: 'addReceiveGroupAdminApprovalListener.isAgree is null');

      verifyUser(event.groupAdmin);
      for (var user in event.users) {
        verifyUser(user);
      }
      print('listener receive event - group admin approval');
    });

    jmessage.addReceiveMessageReceiptStatusChangelistener(
        (JMConversationInfo conversation, List<String> serverMessageIdList) {
      print("listener receive event - message receipt status change");

      //for (var serverMsgId in serverMessageIdList) {
      //  jmessage.getMessageByServerMessageId(type: conversation.target, serverMessageId: serverMsgId);
      //}
    });
  }

// addReceiveMessageListener
// addClickMessageNotificationListener
// addSyncOfflineMessageListener
// addSyncRoamingMessageListener
// addLoginStateChangedListener
// addContactNotifyListener
// addMessageRetractListener
// addReceiveTransCommandListener
// removeReceiveTransCommandListener
// addReceiveChatRoomMessageListener
// addReceiveApplyJoinGroupApprovalListener
// addReceiveGroupAdminRejectListener
// addReceiveGroupAdminApprovalListener
  void testSendMessageAPIs() async {
    // test('sendTextMessage', () async {
    //       JMTextMessage msg = await jmessage.sendTextMessage(
    //         type: kMockUser,
    //         text: 'Text Message Test!',
    //       );
    //       verifyMessage(msg);
    //     });

    test('sendImageMessage', () async {
      // TODO: send prepare image file
      JMImageMessage msg = await jmessage.sendImageMessage(
        type: kMockUser,
        path: '',
      );
      verifyMessage(msg);

      // TODO: test download media
      //downloadThumbImage
      //downloadOriginalImage
    });

    test('sendVoiceMessage', () async {
      // TODO: send prepare voice file
      JMVoiceMessage msg = await jmessage.sendVoiceMessage(
        type: kMockGroup,
        path: '',
      );
      verifyMessage(msg);
      // TODO: test download media
      //downloadVoiceFile
    });

    test('sendCustomMessage', () async {
      JMCustomMessage msg = await jmessage.sendCustomMessage(
          type: kMockGroup, customObject: {'customKey1': 'customValue1'});
      verifyMessage(msg);
    });

    test('sendLocationMessage', () async {
      // JMLocationMessage msg = await jmessage.sendVoiceMessage(
      //   type: kMockUser
      // )
      // verifyMessage(msg);
    });

    test('sendFileMessage', () async {
      // JMFileMessage msg = await jmessage.sendFileMessage(
      //   type: kMockUser,
      // );
      // verifyMessage(msg);

      // await jmessage.retractMessage(
      //   type: kMockUser,
      //   messageId: msg.id
      // );

      // TODO: test Download file
      //downloadFile
    });
    test('retractMessage', () async {
      JMTextMessage msg = await jmessage.sendTextMessage(
        type: kMockUser,
        text: 'Text Message Test!',
      );

      await jmessage.retractMessage(
          target: kMockUser, serverMessageId: msg.serverMessageId);
    });
  }

  void testMediaAPis() async {
    test('updateMyAvatar', () async {
      // TODO:
    });

    test('updateGroupAvatar', () async {
      // TODO:
    });
  }

  void testHandleRequest() async {
// TODO: Handle request
    test('acceptInvitation', () async {});

    test('declineInvitation', () async {});

    test('removeFromFriendList', () async {
      // await jmessage.removeFromFriendList(
      //   username: kMockTargetUserName,
      // );
    });
  }

  void testAPIs() async {
    await jmessage.login(username: kMockUserName, password: kMockPassword);
    group('$JmessageFlutter', () {
      // JmessageFlutter jmessage = JmessageFlutter();

      setUp(() async {
        // TEST: Event
        // jmessage.addClickMessageNotificationListener(callback)
      });

      // jmessage.login(username: kMockUserName,password: kMockPassword).then((res) {

      // }
      // );

      // TODO: TEST: register
      //   await jmessage.userRegister({username: });

      // test('getMyInfo', () async {
      //   final JMUserInfo user = await jmessage.getMyInfo();
      //   print('the user info: ${user.toJson()}');
      //   verifyUser(user);
      //   print('test   getMyInfo success');
      // });

      test('setBadge', () async {
        // Must success
        await jmessage.setBadge(badge: 5);
        print('test   setBadge success');
      });

      // test('getUserInfo', () async {
      //   final JMUserInfo user = await jmessage.getUserInfo(username: '0002');
      //   print(user.toJson());
      //   verifyUser(user);
      //   print('test    getUserInfo success');
      // });

      test('updateMyPassword', () async {
        await jmessage.updateMyPassword(
            oldPwd: kMockPassword, newPwd: kMockPassword);
        print('test    updateMyPassword success');
      });

      test('updateMyInfo', () async {
        JMGender _gender = JMGender.male;
        Map _extras = {'aa': 'aaa', 'key1': 'value1'};
        await jmessage.updateMyInfo(
            birthday: new DateTime.now().millisecondsSinceEpoch,
            gender: _gender,
            extras: _extras);

        final JMUserInfo user = await jmessage.getMyInfo();
        // expect(user.extras, _extras);
        expect(user.gender, _gender);
        print('test    updateMyInfo success');
        print(user.toJson());
      });

      test('createGroup', () async {
        String gid = await jmessage.createGroup(
            groupType: JMGroupType.private,
            name: kMockGroupName,
            desc: kMockGroupDesc);
        expect(gid, isNotNull);

        Map res = await jmessage.downloadThumbGroupAvatar(id: gid);
        expect(res['id'], isNotNull,
            reason: 'downloadThumbGroupAvatar id is null');
        expect(res['filePath'], isNotNull,
            reason: 'downloadThumbGroupAvatar filePath is null');

        Map originRes = await jmessage.downloadOriginalGroupAvatar(id: gid);
        expect(originRes['id'], isNotNull,
            reason: 'downloadOriginalGroupAvatar id is null');
        expect(originRes['filePath'], isNotNull,
            reason: 'downloadOriginalGroupAvatar filePath is null');
        print('test    createGroup success');
      });

      test('createConversation', () async {
        // User
        print('test    create conversation single');
        JMConversationInfo singleConversation = await jmessage.createConversation(
            target:
                kMockUser); //@required dynamic target, //(JMSingle | JMGroup | JMChatRoom)
        verifyConversation(singleConversation);
        // Group
        print('test    create conversation group');
        JMConversationInfo groupConversation =
            await jmessage.createConversation(target: kMockGroup);
        verifyConversation(groupConversation);
        print('test    create conversation group1');
        // ChatRoom
        JMConversationInfo chatRoomConversation =
            await jmessage.createConversation(target: kMockChatRoom);
        print('test    create conversation chatRoom');
        verifyConversation(chatRoomConversation);
        print('test    createConversation done');
      });

      test('setConversationExtras', () async {
        JMConversationInfo singleConversation = await jmessage.createConversation(
            target:
                kMockUser); //@required dynamic target, //(JMSingle | JMGroup | JMChatRoom)
        verifyConversation(singleConversation);

        print('test    setConversationExtras');
        JMConversationInfo conversationInfo = await jmessage
            .setConversationExtras(
                type: kMockUser, extras: {'extrasKey1': 'extrasValue'});
        verifyConversation(conversationInfo);
        print('test    setConversationExtras done');
      });

      test('getHistoryMessages', () async {
        List msgs = await jmessage.getHistoryMessages(
            type: kMockUser, from: 0, limit: 20);

        for (var msg in msgs) {
          verifyMessage(msg);
          print('test   getHistoryMessages the message: ${msg.toJson()}');
        }

        print('test   getHistoryMessages done');
      });

      test('getMessageById', () async {
        print('test getMessageById');
        JMTextMessage msg = await jmessage.sendTextMessage(
          type: kMockUser,
          text: 'Text Message Test!',
          // extras: {'messageKey1': 'messageValue2'},
          // sendOption: JMMessageSendOptions.fromJson({
          //   'isShowNotification': true,
          //   'isRetainOffline': true,
          // })
        );
        print('test getMessageById :send text message succes');
        var message =
            await jmessage.getMessageById(type: kMockUser, messageId: msg.id);
        verifyMessage(message);
        print('test   getMessageById done');
      });

      test('deleteMessageById', () async {
        JMTextMessage msg = await jmessage.sendTextMessage(
          type: kMockUser,
          text: 'Text Message Test!',
        );
        await jmessage.deleteMessageById(type: kMockUser, messageId: msg.id);

        print('test   deleteMessageById done');
      });

      test('sendInvitationRequest', () async {
        // await jmessage.sendInvitationRequest(
        //   username: kMockTargetUserName,
        //   reason: 'hi~'
        // );

        // print('test   sendInvitationRequest done');
      });

      test('updateFriendNoteName', () async {
        await jmessage.updateFriendNoteName(
            username: kMockTargetUserName,
            noteName: 'test   update FriendNoteName');

        print('test   updateFriendNoteName done');
      });

      test('updateFriendNoteText', () async {
        await jmessage.updateFriendNoteText(
            username: kMockTargetUserName,
            noteText: 'test   update FriendNoteText');

        print('test   updateFriendNoteText done');
      });

      test('getFriends', () async {
        List friends = await jmessage.getFriends();
        friends.map((user) {
          verifyUser(user);
        });

        print('test   getFriends done');
      });

      test('getGroupIds', () async {
        List gids = await jmessage.getGroupIds();
        gids.map((gid) {
          expect(gid, isNotNull);
        });

        print('test   getIds done');
      });

      test('updateGroupInfo', () async {
        const String kMockNewName = 'the new name';
        const String kMockNewDesc = 'the new desc';
        await jmessage.updateGroupInfo(
            id: kMockGroupId, newName: kMockNewName, newDesc: kMockNewDesc);

        JMGroupInfo group = await jmessage.getGroupInfo(id: kMockGroupId);
        expect(group.name, kMockNewName,
            reason: 'the group name udpate failed');
        expect(group.desc, kMockNewDesc, reason: 'the group name desc failed');
        print('test   updateGroupInfo done');
      });

      test('addGroupMembers', () async {
        await jmessage.addGroupMembers(
          id: kMockGroupId,
          usernameArray: ['0002', '0003'],
        );
        print('test   addGroupMembers done');
      });

      test('removeGroupMembers', () async {
        // TODO:
        // jmessage.removeGroupMembers(
        //   id: kMockGroupId,
        //   usernameArray: ['0002', '0003'],
        // );
      });

      test('exitGroup', () async {
        // dart operation
        // await jmessage.exitGroup(
        //   id: kMockGroupId
        // );
        // print('test   exitGroup done');
      });

      test('getGroupMembers', () async {
        List groups = await jmessage.getGroupMembers(id: kMockGroupId);

        groups.map((groupMember) {
          verifyGroupMember(groupMember);
        });
        print('test   getGroupMembers done');
      });

      test('addUsersToBlacklist', () async {
        await jmessage.addUsersToBlacklist(
          usernameArray: ['0006'],
        );
        print('test   addUsersToBlacklist done');
      });

      test('removeUsersFromBlacklist', () async {
        await jmessage.removeUsersFromBlacklist(
          usernameArray: ['0006'],
        );
        print('test   removeUsersFromBlacklist done');
      });

      test('getBlacklist', () async {
        List users = await jmessage.getBlacklist();
        users.map((user) {
          verifyUser(user);
        });
        print('test   getBlacklist done');
      });

      test('setNoDisturb', () async {
        await jmessage.setNoDisturb(target: kMockUser, isNoDisturb: false);

        await jmessage.setNoDisturb(target: kMockUser, isNoDisturb: true);

        print('test   setNoDisturb done');
      });

      test('getNoDisturbList', () async {
        Map res = await jmessage.getNoDisturbList();
        expect(res['userInfos'], isNotNull,
            reason: 'getNoDisturbList userInfos is null');
        expect(res['groupInfos'], isNotNull,
            reason: 'getNoDisturbList groupInfos is null');

        List userInfos = res['userInfos'];
        userInfos.map((user) {
          verifyUser(user);
        });

        List groupInfos = res['groupInfos'];
        groupInfos.map((group) {
          verifyGroupInfo(group);
        });
        print('test   getNoDisturbList done');
      });

      test('setNoDisturbGlobal', () async {
        await jmessage.setNoDisturbGlobal(isNoDisturb: true);
        bool isNoDisturb = await jmessage.isNoDisturbGlobal();
        expect(isNoDisturb, true);

        await jmessage.setNoDisturbGlobal(isNoDisturb: false);
        isNoDisturb = await jmessage.isNoDisturbGlobal();
        expect(isNoDisturb, false);

        print('test   setNoDisturbGlobal done');
      });

      test('blockGroupMessage', () async {
        await jmessage.blockGroupMessage(id: kMockGroupId, isBlock: true);

        bool res = await jmessage.isGroupBlocked(id: kMockGroupId);
        expect(res, true);

        await jmessage.blockGroupMessage(id: kMockGroupId, isBlock: false);

        res = await jmessage.isGroupBlocked(id: kMockGroupId);
        expect(res, false);
        print('test   blockGroupMessage done');
      });

      test('getBlockedGroupList', () async {
        List groups = await jmessage.getBlockedGroupList();
        groups.map((group) {
          verifyGroupInfo(group);
        });

        print('test   getBlockedGroupList done');
      });

      test('downloadThumbUserAvatar', () async {
        Map resJson =
            await jmessage.downloadThumbUserAvatar(username: kMockUserName);
        expect(resJson['username'], isNotNull);
        expect(resJson['appKey'], isNotNull);
        expect(resJson['filePath'], isNotNull);
        print('test   downloadThumbUserAvatar done');
      });

      test('downloadOriginalUserAvatar', () async {
        Map resJson =
            await jmessage.downloadThumbUserAvatar(username: kMockUserName);
        expect(resJson['username'], isNotNull);
        expect(resJson['appKey'], isNotNull);
        expect(resJson['filePath'], isNotNull);
        print('test   downloadOriginalUserAvatar done');
      });

      // test('deleteConversation', () async {
      //   await jmessage.deleteConversation(
      //     target: kMockUser
      //   );
      //   await jmessage.createConversation(target: kMockUser);
      // });

      test('enterConversation', () {
        jmessage.enterConversation(target: kMockUser);
        jmessage.exitConversation(target: kMockUser);
        print('test   enterConversation done');
      });

      test('getConversation', () async {
        JMConversationInfo conversation =
            await jmessage.getConversation(target: kMockUser);
        verifyConversation(conversation);
        print('test   getConversation done ');
      });

      test('getConversations', () async {
        List conversations = await jmessage.getConversations();
        conversations.map((conv) {
          verifyConversation(conv);
        });

        print('test   getConversations done ');
      });

      test('resetUnreadMessageCount', () async {
        await jmessage.resetUnreadMessageCount(target: kMockUser);
      });

      test('transferGroupOwner', () async {
        // TODO:
        // NOTE: dart
        // await jmessage.transferGroupOwner(
        //   groupId: kMockGroupId,
        //   username: '0002',
        //   );
      });

      test('setGroupMemberSilence', () async {
        print('flutter test setGroupMemberSilence');
        await jmessage.setGroupMemberSilence(
          groupId: kMockGroupId,
          isSilence: true,
          username: '0002',
        );
        print('flutter setGroupMemberSilence done');

        bool isSilenceMember = await jmessage.isSilenceMember(
            groupId: kMockGroupId, username: '0002');
        print('flutter isSilenceMember done');

        expect(isSilenceMember, true, reason: 'isSilenceMember is not true');

        await jmessage.setGroupMemberSilence(
          groupId: kMockGroupId,
          isSilence: false,
          username: '0002',
        );

        isSilenceMember = await jmessage.isSilenceMember(
            groupId: kMockGroupId, username: '0002');

        expect(isSilenceMember, false, reason: 'isSilenceMember is not false');
        print('flutter test setGroupMemberSilence isSilenceMember done');
      });

      test('groupSilenceMembers', () async {
        List members =
            await jmessage.groupSilenceMembers(groupId: kMockGroupId);
        members.map((user) {
          verifyUser(user);
        });
      });

      test('setGroupNickname', () async {
        const String kMockgroupNickName = 'newGroupMemberNickName';
        await jmessage.setGroupNickname(
            groupId: kMockGroupId,
            username: '0002',
            nickName: kMockgroupNickName);

        List<JMGroupMemberInfo> groups =
            await jmessage.getGroupMembers(id: kMockGroupId);
        groups.map((groupMember) {
          verifyGroupMember(groupMember);
          if (groupMember.user.username == '0002') {
            expect(groupMember.groupNickname, kMockgroupNickName);
          }
        });
      });

      test('enterChatRoom', () async {
        await jmessage.enterChatRoom(roomId: kMockChatRoomid);
      });

      test('exitChatRoom', () async {
        await jmessage.exitChatRoom(roomId: kMockChatRoomid);
      });

      test('getChatRoomConversation', () async {
        JMConversationInfo conv =
            await jmessage.getChatRoomConversation(roomId: kMockChatRoomid);
        verifyConversation(conv);
      });

      test('getChatRoomConversationList', () async {
        List<JMConversationInfo> conversations =
            await jmessage.getChatRoomConversationList();
        conversations.map((conv) {
          verifyConversation(conv);
        });
        print('test   getChatRoomConversationList done ');
      });

      test('getAllUnreadCount', () async {
        num allUnreadCount = await jmessage.getAllUnreadCount();
        expect(allUnreadCount, isNotNull);
      });

      test('addGroupAdmins', () async {
        await jmessage.addGroupAdmins(
          groupId: kMockGroupId,
          usernames: ['0002'],
        );

        List<JMGroupMemberInfo> groups =
            await jmessage.getGroupMembers(id: kMockGroupId);
        groups.map((groupMember) {
          verifyGroupMember(groupMember);
          if (groupMember.user.username == '0002') {
            expect(groupMember.memberType, JMGroupMemberType.admin);
          }
        });

        await jmessage.removeGroupAdmins(
          groupId: kMockGroupId,
          usernames: ['0002'],
        );

        groups = await jmessage.getGroupMembers(id: kMockGroupId);
        groups.map((groupMember) {
          verifyGroupMember(groupMember);
          if (groupMember.user.username == '0002') {
            expect(groupMember.memberType, JMGroupMemberType.ordinary);
          }
        });
      });

      test('changeGroupType', () async {
        await jmessage.changeGroupType(
            groupId: kMockGroupId, type: JMGroupType.public);

        await jmessage.changeGroupType(
            groupId: kMockGroupId, type: JMGroupType.private);
      });

      test('getPublicGroupInfos', () async {
        List groups = await jmessage.getPublicGroupInfos(
          appKey: kMockAppkey,
          start: 0,
          count: 20,
        );

        groups.map((group) {
          verifyGroupInfo(group);
        });
        print('get group info success');
      });

      test('applyJoinGroup', () async {
        // await jmessage.applyJoinGroup(
        //   groupId: kMockGroupId
        // );
      });

      test('processApplyJoinGroup', () async {
        // await jmessage.processApplyJoinGroup(
        //   events: [],
        //   isAgree: true,
        //   isRespondInviter: true,
        // );
      });

      test('dissolveGroup', () async {
        // await jmessage.dissolveGroup(groupId: kMockGroupId);
      });

      test('logout', () async {
        // await jmessage.logout();
      });
    });

    //processApplyJoinGroup
    //dissolveGroup
    // logout
  }

  Widget _buildContext() {
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: new Container(
        color: Colors.grey,
        height: double.infinity,
        child: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
              height: 35,
              color: Colors.brown,
              child: new CustomTextField(
                  hintText: "请输入登录的 username", controller: usernameTextEC1),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(" "),
                new CustomButton(title: "注册", onPressed: demoRegisterAction),
                new Text(" "),
                new CustomButton(title: "登录", onPressed: demoLoginUserAction),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(" "),
                new CustomButton(
                    title: "用户信息", onPressed: demoGetCurrentUserInfo),
                new Text(" "),
                new CustomButton(title: "退出", onPressed: demoLogoutAction),
              ],
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: 35,
              color: Colors.brown,
              child: new CustomTextField(
                  hintText: "请输入username", controller: usernameTextEC2),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(" "),
                new CustomButton(
                    title: "发送文本消息", onPressed: demoSendTextMessage),
                new Text(" "),
                new CustomButton(
                    title: "发送图片消息", onPressed: demoSendImageMessage),
                new Text(" "),
                new CustomButton(
                    title: "发送位置消息", onPressed: demoSendLocationMessage),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(" "),
                new CustomButton(
                    title: "会话管理界面",
                    onPressed: () {
                      jmessage.getMyInfo().then((JMUserInfo userInfo) {
                        if (userInfo != null) {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new ConversationManageView()));
                        } else {
                          setState(() {
                            _result = " 请先登录 ";
                          });
                        }
                      });
                    }),
                new Text(" "),
                new CustomButton(
                  title: "群组管理界面",
                  onPressed: () {
                    jmessage.getMyInfo().then((JMUserInfo userInfo) {
                      if (userInfo != null) {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new GroupManageView()));
                      } else {
                        setState(() {
                          _result = " 请先登录 ";
                        });
                      }
                    });
                  },
                ),
              ],
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
              color: Colors.brown,
              child: Text(_result),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 200),
              //height: 300,
            ),
          ],
        ),
      ),
    );
  }

  bool _loading = false;
  String _result = "展示信息栏";
  var usernameTextEC1 = new TextEditingController();
  var usernameTextEC2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('JMessage Plugin App'),
      ),
      body: ModalProgressHUD(child: _buildContext(), inAsyncCall: _loading),
    );
  }
}

void verifyUser(JMUserInfo user) {
  expect(user, isNotNull, reason: 'user');
  expect(user.username, isNotNull, reason: 'user.username');
  expect(user.appKey, isNotNull, reason: 'user.appkey');
  expect(user.nickname, isNotNull, reason: 'user.nickname');
  expect(user.avatarThumbPath, isNotNull, reason: 'user.avatarThumbPath');
  expect(user.birthday, isNotNull, reason: 'user.birthday');
  expect(user.region, isNotNull, reason: 'user.region');
  expect(user.signature, isNotNull, reason: 'user.signature');
  expect(user.address, isNotNull, reason: 'user.address');
  expect(user.noteName, isNotNull, reason: 'user.noteName');
  expect(user.noteText, isNotNull, reason: 'user.noteText');
  expect(user.isNoDisturb, isNotNull, reason: 'user.isNoDisturb');
  expect(user.isInBlackList, isNotNull, reason: 'user.isInBlackList');
  expect(user.isFriend, isNotNull, reason: 'user.isFriend');
  expect(user.extras, isNotNull, reason: 'user.extras');
}

void verifyGroupInfo(JMGroupInfo group) {
  expect(group, isNotNull, reason: 'group is null');
  expect(group.id, isNotNull, reason: 'group id is null');
  expect(group.name, isNotNull, reason: 'group name is null');
  expect(group.desc, isNotNull, reason: 'group desc is null');
  expect(group.level, isNotNull, reason: 'group level is null');
  expect(group.owner, isNotNull, reason: 'group owner is null');
  expect(group.ownerAppKey, isNotNull, reason: 'group ownerAppKey is null');
  expect(group.maxMemberCount, isNotNull,
      reason: 'group maxMemberCount is null');
  expect(group.isNoDisturb, isNotNull, reason: 'group isNoDisturb is null');
  expect(group.isBlocked, isNotNull, reason: 'group isBlocked is null');
}

void verifyGroupMember(JMGroupMemberInfo groupMember) {
  expect(groupMember, isNotNull);
  expect(groupMember.groupNickname, isNotNull);
  expect(groupMember.joinGroupTime, isNotNull);
  verifyUser(groupMember.user);
}

void verifyConversation(JMConversationInfo conversation) {
  expect(conversation, isNotNull, reason: 'conversation is null');
  expect(conversation.conversationType, isNotNull,
      reason: 'conversation conversationType is null');
  expect(conversation.title, isNotNull, reason: 'conversation title is null');
  expect(conversation.unreadCount, isNotNull,
      reason: 'conversation unreadCount is null');
  expect(conversation.target, isNotNull, reason: 'conversation target is null');

  // do not test lastMessage, if conversation do not have lastmessage it will be null
  // expect(conversation.latestMessage, isNotNull, reason: 'conversation conversationType is null');
}

void verifyMessage(dynamic msg) {
  expect(msg.id, isNotNull, reason: 'message id is null');
  expect(msg.serverMessageId, isNotNull, reason: 'serverMessageId id is null');
  expect(msg.isSend, isNotNull, reason: 'message isSend is null');
  expect(msg.createTime, isNotNull, reason: 'message createTime is null');
  expect(msg.from, isNotNull, reason: 'message from is null');
  verifyUser(msg.from);

  expect(msg.target, isNotNull, reason: 'message from is null');
  if (msg.target is JMUserInfo) {
    verifyUser(msg.target);
  }
  if (msg.target is JMGroupInfo) {
    verifyGroupInfo(msg.target);
  }
}

/// 封装控件
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomButton({@required this.onPressed, @required this.title});

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      onPressed: onPressed,
      child: new Text("$title"),
      color: Color(0xff585858),
      highlightColor: Color(0xff888888),
      splashColor: Color(0xff888888),
      textColor: Colors.white,
      //padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({@required this.hintText, @required this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      height: 35,
      color: Colors.brown,
      child: new TextField(
        autofocus: false,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: hintText, hintStyle: TextStyle(color: Colors.black)),
        controller: controller,
      ),
    );
  }
}
