part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Upload extends Equatable {
  int id;
  String content_type;
  int author_id;
  String name;
  String url;
  String uid;
  String remark;
  String file;
  String date;
  int object_id;

  static Upload fromJson(Map<String, dynamic> json) => _$UploadFromJson(json);
  Map<String, dynamic> toJson() => _$UploadToJson(this);

  @override
  List<Object> get props => [
        id,
        content_type,
        author_id,
        name,
        url,
        uid,
        remark,
        file,
        date,
        object_id
      ];
}

@JsonSerializable()
class UploadExtra extends Equatable {
  Upload data;
  Map<String, dynamic> extra;

  static UploadExtra fromJson(Map<String, dynamic> json) =>
      _$UploadExtraFromJson(json);
  Map<String, dynamic> toJson() => _$UploadExtraToJson(this);

  @override
  List<Object> get props => [data, extra];
}

@JsonSerializable()
class UploadList extends Equatable {
  List<Upload> data;

  static UploadList fromJson(Map<String, dynamic> json) =>
      _$UploadListFromJson(json);
  Map<String, dynamic> toJson() => _$UploadListToJson(this);

  @override
  List<Object> get props => [data];
}
