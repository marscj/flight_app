import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class BookingState extends Equatable {
  final Booking data;

  BookingState({this.data});

  factory BookingState.initial() => BookingState(data: null);

  BookingState copyWith({Booking data}) => BookingState(data: data);

  @override
  List<Object> get props => [data];
}
