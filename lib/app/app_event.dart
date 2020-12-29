part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppEvent {}

class SignOut extends AppEvent {}

class UpdateAppUser extends AppEvent {
  final User user;

  UpdateAppUser(this.user);
}
