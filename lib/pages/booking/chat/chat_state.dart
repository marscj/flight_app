import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class ChatState extends Equatable {
  /// notify change state without deep clone state
  final List<Comment> list;

  ChatState({this.list});

  factory ChatState.initial() => ChatState(list: List<Comment>());

  ChatState copyWith({List<Comment> list}) =>
      ChatState(list: list ?? this.list);

  @override
  List<Object> get props => [
        list,
      ];
}
