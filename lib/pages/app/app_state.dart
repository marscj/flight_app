import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';

class AppState extends Equatable {
  final User user;
  final AppEvent event;

  AppState({this.user, this.event});

  factory AppState.initial() => AppState(user: null, event: null);

  AppState copyWith({User user, AppEvent event}) =>
      AppState(user: user, event: event);

  @override
  List<Object> get props => ([user]);
}
