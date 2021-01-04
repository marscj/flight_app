part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Itinerary extends Equatable {
  int id;
  String serial_no;
  String email;
  String name;
  String passport_no;
  String entry;
  String exit;
  String ticket1;
  String ticket2;
  String hotel;
  bool is_lock;
  String remark;
  String date;
  List<Upload> uploads;
  List<Comment> comments;

  static Itinerary fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryToJson(this);

  @override
  List<Object> get props => [
        id,
        serial_no,
        email,
        name,
        passport_no,
        entry,
        exit,
        ticket1,
        ticket2,
        hotel,
        is_lock,
        remark,
        date,
      ];
}

@JsonSerializable()
class ItineraryList extends Equatable {
  List<Itinerary> data;

  static ItineraryList fromJson(Map<String, dynamic> json) =>
      _$ItineraryListFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryListToJson(this);

  @override
  List<Object> get props => [data];
}
