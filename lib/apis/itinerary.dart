part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Itinerary extends Equatable {
  int id;

  static Itinerary fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryToJson(this);

  @override
  List<Object> get props => [
        id,
      ];
}

@JsonSerializable()
class ItineraryList extends Equatable {
  int totalCount;
  int pageNo;
  List<Itinerary> data;

  static ItineraryList fromJson(Map<String, dynamic> json) =>
      _$ItineraryListFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryListToJson(this);

  @override
  List<Object> get props => [totalCount, pageNo, data];
}

@JsonSerializable()
class ItineraryExtra extends Equatable {
  Itinerary data;
  Map<String, dynamic> extra;

  static ItineraryExtra fromJson(Map<String, dynamic> json) =>
      _$ItineraryExtraFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryExtraToJson(this);

  @override
  List<Object> get props => [data, extra];
}

@JsonSerializable()
class ItineraryListExtra extends Equatable {
  ItineraryList data;
  Map<String, dynamic> extra;

  static ItineraryListExtra fromJson(Map<String, dynamic> json) =>
      _$ItineraryListExtraFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryListExtraToJson(this);

  @override
  List<Object> get props => [data, extra];
}
