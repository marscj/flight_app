part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Comment extends Equatable {
  int id;
  String comment;
  int rating;
  bool read;
  String content_type;
  int author_id;
  String date;
  int object_id;

  static Comment fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  List<Object> get props => [
        id,
        comment,
        rating,
        read,
        content_type,
        author_id,
        date,
        object_id,
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
