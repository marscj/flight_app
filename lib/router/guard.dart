import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_state.dart';
import 'package:saadiyat/router/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final BuildContext context;

  AuthGuard(this.context);
  @override
  Future<bool> canNavigate(
      List<PageRouteInfo> pendingRoutes, StackRouter router) async {
    // ignore: close_sinks
    AppState appState = BlocProvider.of<AppBloc>(context).state;
    if (appState.user == null) {
      router.push(LoginRoute(onLoginResult: (success) {
        if (success) {
          router.pop();
          router.replaceAll(pendingRoutes);
        }
      }));
      return false;
    }
    return true;
  }
}
