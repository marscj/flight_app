import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';

class AppState extends Equatable {
  final String version;
  final String code;
  final User user;
  final AppEvent event;
  final PageRouteInfo route;
  final List<Message> messages;

  AppState(
      {this.version,
      this.code,
      this.user,
      this.event,
      this.route,
      this.messages});

  factory AppState.initial() => AppState(
      version: '1.0.0',
      code: '1',
      user: null,
      event: null,
      route: null,
      messages: []);

  AppState copyWith(
      {String version,
      String code,
      User user,
      AppEvent event,
      PageRouteInfo route,
      List<Message> messages}) {
    return AppState(
        version: version ?? this.version,
        code: code ?? this.code,
        user: user ?? this.user,
        event: event,
        route: route,
        messages: messages ?? this.messages);
  }

  @override
  List<Object> get props => ([version, code, user, event, route, messages]);
}
