import 'dart:async';

import 'package:meta/meta.dart';
import 'package:saadiyat/apis/client.dart';

import 'bookings_bloc.dart';
import 'bookings_state.dart';

@immutable
abstract class BookingsEvent {
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc});
}

class RefreshBookingsEvent extends BookingsEvent {
  @override
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc}) async* {
    yield await RestClient().getBookings(query: {
      'pageNo': 1,
      'pageSize': currentState.pageSize,
      'sorter': '-id'
    }).then((res) {
      bloc.easyRefreshController.finishRefresh(success: true);
      return currentState.copyWith(
          pageNo: 2, totalCount: res.data.totalCount, list: res.data.data);
    }).catchError((error) {
      bloc.easyRefreshController.finishRefresh(success: false);
      return currentState.copyWith(pageNo: 1, totalCount: 0, list: []);
    });
  }
}

class LoadBookingsEvent extends BookingsEvent {
  @override
  Stream<BookingsState> applyAsync(
      {BookingsState currentState, BookingsBloc bloc}) async* {
    if (currentState.list.length < currentState.totalCount) {
      yield await RestClient().getBookings(query: {
        'pageNo': currentState.pageNo,
        'pageSize': currentState.pageSize,
        'sorter': '-id'
      }).then((res) {
        bloc.easyRefreshController.finishLoad(
            success: true,
            noMore: currentState.list.length + res.data.data.length >=
                res.data.totalCount);
        return currentState.copyWith(
            list: currentState.list + res.data.data,
            pageNo: currentState.pageNo + 1,
            totalCount: currentState.totalCount);
      }).catchError((error) {
        bloc.easyRefreshController.finishLoad(success: false);
        return currentState;
      });
    } else {
      bloc.easyRefreshController.finishLoad(noMore: true);
    }
  }
}
