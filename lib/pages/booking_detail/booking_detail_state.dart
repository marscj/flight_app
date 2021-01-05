import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class BookingDetailState extends Equatable {
  final Booking data;

  BookingDetailState({this.data});

  factory BookingDetailState.initial() => BookingDetailState(data: null);

  BookingDetailState copyWith({Booking data}) => BookingDetailState(data: data);

  @override
  List<Object> get props => [data];
}
