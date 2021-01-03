import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  
  final List propss;
  ChatState(this.version,[this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  ChatState getStateCopy();

  ChatState getNewVersion();

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnChatState extends ChatState {

  UnChatState(int version) : super(version);

  @override
  String toString() => 'UnChatState';

  @override
  UnChatState getStateCopy() {
    return UnChatState(0);
  }

  @override
  UnChatState getNewVersion() {
    return UnChatState(version+1);
  }
}

/// Initialized
class InChatState extends ChatState {
  final String hello;

  InChatState(int version, this.hello) : super(version, [hello]);

  @override
  String toString() => 'InChatState $hello';

  @override
  InChatState getStateCopy() {
    return InChatState(version, hello);
  }

  @override
  InChatState getNewVersion() {
    return InChatState(version+1, hello);
  }
}

class ErrorChatState extends ChatState {
  final String errorMessage;

  ErrorChatState(int version, this.errorMessage): super(version, [errorMessage]);
  
  @override
  String toString() => 'ErrorChatState';

  @override
  ErrorChatState getStateCopy() {
    return ErrorChatState(version, errorMessage);
  }

  @override
  ErrorChatState getNewVersion() {
    return ErrorChatState(version+1, 
    errorMessage);
  }
}
