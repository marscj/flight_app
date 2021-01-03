part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Booking extends Equatable {
  int id;
  String title;
  String remark;
  String date;
  User author;

  static Booking fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);

  @override
  List<Object> get props => [id, title, remark, date, author];
}

@JsonSerializable()
class BookingList extends Equatable {
  int totalCount;
  int pageNo;
  List<Booking> data;

  static BookingList fromJson(Map<String, dynamic> json) =>
      _$BookingListFromJson(json);
  Map<String, dynamic> toJson() => _$BookingListToJson(this);

  @override
  List<Object> get props => [totalCount, pageNo, data];
}
