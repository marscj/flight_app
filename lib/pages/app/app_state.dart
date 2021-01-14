import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';

class AppState extends Equatable {
  final int version;
  final User user;
  final AppEvent event;

  AppState({this.version, this.user, this.event});

  factory AppState.initial() =>
      AppState(version: 0, user: null, event: AppInitEvent());

  AppState copyWith({User user, AppEvent event}) {
    return AppState(
      version: this.version + 1,
      user: user ?? this.user,
      event: event ?? this.event,
    );
  }

  @override
  List<Object> get props => ([version, user, event]);
}
