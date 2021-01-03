import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class BookingsState extends Equatable {
  /// notify change state without deep clone state
  final List<Booking> list;
  final int pageNo;
  final int pageSize;
  final int totalCount;

  BookingsState({this.pageNo, this.pageSize, this.totalCount, this.list});

  factory BookingsState.initial() => BookingsState(
      list: List<Booking>(), pageNo: 1, pageSize: 10, totalCount: 0);

  BookingsState copyWith(
          {List<Booking> list, int pageNo, int pageSize, int totalCount}) =>
      BookingsState(
          list: list ?? this.list,
          pageNo: pageNo ?? this.pageNo,
          pageSize: pageSize ?? this.pageSize,
          totalCount: totalCount ?? this.totalCount);

  @override
  List<Object> get props => [list, pageNo, pageSize, totalCount];
}
