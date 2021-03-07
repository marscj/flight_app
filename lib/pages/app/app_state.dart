import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';

class AppState extends Equatable {
  final String version;
  final String code;
  final User user;
  final AppEvent event;
  final List<Message> messages;
  final PageRouteInfo route;

  AppState(
      {this.version,
      this.code,
      this.user,
      this.event,
      this.route,
      this.messages});

  factory AppState.initial() => AppState(
      version: '1.0.0', code: '1', user: null, event: null, route: null);

  AppState copyWith(
      {String version,
      String code,
      user,
      AppEvent event,
      PageRouteInfo route,
      List<Message> messages}) {
    return AppState(
        version: version ?? this.version,
        code: code ?? this.code,
        user: user,
        event: event,
        route: route,
        messages: messages ?? this.messages);
  }

  @override
  List<Object> get props => ([version, code, user, event, route]);
}
