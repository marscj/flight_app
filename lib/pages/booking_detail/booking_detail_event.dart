import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';
import 'package:saadiyat/pages/booking_detail/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookingDetailEvent {
  Stream<BookingDetailState> applyAsync(
      {BookingDetailState currentState, BookingDetailBloc bloc});
}

class RefreshBookingDetailEvent extends BookingDetailEvent {
  final BookingExtra result;
  final BuildContext context;

  RefreshBookingDetailEvent(this.result, this.context);

  @override
  Stream<BookingDetailState> applyAsync(
      {BookingDetailState currentState, BookingDetailBloc bloc}) async* {
    // ignore: close_sinks
    AppBloc bloc = BlocProvider.of<AppBloc>(context);
    bloc.add(UpdateMessagesEvent(result.extra ?? []));
    yield currentState.copyWith(data: result?.data);
  }
}
