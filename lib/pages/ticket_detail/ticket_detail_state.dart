import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class TicketDetailState extends Equatable {
  final Ticket data;

  TicketDetailState({this.data});

  factory TicketDetailState.initial() => TicketDetailState(data: null);

  TicketDetailState copyWith({Ticket data}) => TicketDetailState(data: data);

  @override
  List<Object> get props => [data];
}
