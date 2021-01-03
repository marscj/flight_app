import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class ItineraryState extends Equatable {
  final List<Itinerary> list;

  ItineraryState({this.list});

  factory ItineraryState.initial() => ItineraryState(list: List<Itinerary>());

  ItineraryState copyWith({List<Itinerary> list}) =>
      ItineraryState(list: list ?? this.list);

  @override
  List<Object> get props => [
        list,
      ];
}
