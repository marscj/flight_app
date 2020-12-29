part of 'app_bloc.dart';

class AppState extends Equatable {
  final Locale locale;
  final User user;

  @override
  List<Object> get props => [locale.languageCode, user];

  AppState({
    this.locale,
    this.user,
  });

  factory AppState.initial() => AppState(locale: Locale('en', ''), user: null);

  AppState copyWith({Locale locale, User user, bool loading}) =>
      AppState(locale: locale ?? this.locale, user: user ?? this.user);
}
