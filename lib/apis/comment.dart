part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Comment extends Equatable {
  int id;
  String content;
  bool read;
  String date;
  int object_id;
  String content_type;
  User user;
  List<Comment> child;

  static Comment fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  List<Object> get props => [
        id,
        content,
        read,
        content_type,
        date,
        object_id,
        user,
      ];
}

@JsonSerializable()
class CommentList extends Equatable {
  List<Comment> data;

  static CommentList fromJson(Map<String, dynamic> json) =>
      _$CommentListFromJson(json);
  Map<String, dynamic> toJson() => _$CommentListToJson(this);

  @override
  List<Object> get props => [data];
}
