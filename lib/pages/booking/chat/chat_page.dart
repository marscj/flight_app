import 'package:flutter/material.dart';
import 'package:saadiyat/pages/booking/chat/index.dart';

class ChatPage extends StatefulWidget {
  static const String routeName = '/chat';

  final int id;

  const ChatPage(this.id);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ChatScreen();
  }
}
