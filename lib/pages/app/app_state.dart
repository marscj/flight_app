import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class AppState extends Equatable {
  final User user;

  AppState({this.user});

  factory AppState.initial() => AppState(user: null);

  AppState copyWith({User user}) => AppState(user: user);

  @override
  List<Object> get props => ([user]);
}
