import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class TicketsState extends Equatable {
  /// notify change state without deep clone state
  final List<Ticket> list;
  final int pageNo;
  final int pageSize;
  final int totalCount;

  TicketsState({this.pageNo, this.pageSize, this.totalCount, this.list});

  factory TicketsState.initial() => TicketsState(
      list: List<Ticket>(), pageNo: 1, pageSize: 10, totalCount: 0);

  TicketsState copyWith(
          {List<Ticket> list, int pageNo, int pageSize, int totalCount}) =>
      TicketsState(
          list: list ?? this.list,
          pageNo: pageNo ?? this.pageNo,
          pageSize: pageSize ?? this.pageSize,
          totalCount: totalCount ?? this.totalCount);

  @override
  List<Object> get props => [list, pageNo, pageSize, totalCount];
}
