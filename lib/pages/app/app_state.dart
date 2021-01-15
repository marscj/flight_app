import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';

class AppState extends Equatable {
  final int version;
  final User user;
  final AppEvent event;
  final PageRouteInfo route;

  AppState({this.version, this.user, this.event, this.route});

  factory AppState.initial() =>
      AppState(version: 0, user: null, event: AppInitEvent(), route: null);

  AppState copyWith({User user, AppEvent event, PageRouteInfo route}) {
    return AppState(
        version: this.version + 1, user: user, event: event, route: route);
  }

  @override
  List<Object> get props => ([version, user, event]);
}
