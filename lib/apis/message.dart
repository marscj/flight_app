part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Message extends Equatable {
  int id;
  // dynamic json;
  String date;
  bool read;
  int object_id;
  String content_type;
  User user;

  static Message fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  List<Object> get props =>
      [id, json, read, content_type, date, object_id, user];
}

@JsonSerializable()
class MessageList extends Equatable {
  List<Message> data;

  static MessageList fromJson(Map<String, dynamic> json) =>
      _$MessageListFromJson(json);
  Map<String, dynamic> toJson() => _$MessageListToJson(this);

  @override
  List<Object> get props => [data];
}
