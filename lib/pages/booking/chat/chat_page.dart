import 'package:flutter/material.dart';
import 'package:saadiyat/pages/booking/chat/index.dart';

class ChatPage extends StatefulWidget {
  static const String routeName = '/chat';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ChatScreen(),
    );
  }
}
