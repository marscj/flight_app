import 'dart:async';
import 'dart:developer' as developer;

import 'package:saadiyat/pages/booking/chat/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ChatEvent {
  Stream<ChatState> applyAsync({ChatState currentState, ChatBloc bloc});
}

class UnChatEvent extends ChatEvent {
  @override
  Stream<ChatState> applyAsync({ChatState currentState, ChatBloc bloc}) async* {
    yield UnChatState(0);
  }
}

class LoadChatEvent extends ChatEvent {
  final bool isError;
  @override
  String toString() => 'LoadChatEvent';

  LoadChatEvent(this.isError);

  @override
  Stream<ChatState> applyAsync({ChatState currentState, ChatBloc bloc}) async* {
    try {
      yield UnChatState(0);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadChatEvent', error: _, stackTrace: stackTrace);
      yield ErrorChatState(0, _?.toString());
    }
  }
}
