import 'dart:async';

import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/booking/chat/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ChatEvent {
  Stream<ChatState> applyAsync({ChatState currentState, ChatBloc bloc});
}

class RefreshChatEvent extends ChatEvent {
  final CommentList result;

  RefreshChatEvent(this.result);

  @override
  Stream<ChatState> applyAsync({ChatState currentState, ChatBloc bloc}) async* {
    yield currentState.copyWith(list: result?.data ?? []);
  }
}
