import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class HomeState extends Equatable {
  /// notify change state without deep clone state
  final List<Message> messages;

  HomeState({this.messages});

  factory HomeState.initial() => HomeState(messages: List<Message>());

  HomeState copyWith(
          {List<Message> messages, int pageNo, int pageSize, int totalCount}) =>
      HomeState(
        messages: messages ?? this.messages,
      );

  @override
  // TODO: implement props
  List<Object> get props => [messages];
}
