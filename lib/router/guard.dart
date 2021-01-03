import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/router/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final BuildContext context;

  AuthGuard(this.context);
  @override
  Future<bool> canNavigate(
      List<PageRouteInfo> pendingRoutes, StackRouter router) async {
    // ignore: close_sinks
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    if (!(appBloc.state?.props[0] is User)) {
      // ignore: unawaited_futures
      router.root.push(LoginRoute(onLoginResult: (success) {
        if (success) {
          router.root.pop();
          router.pushAll(pendingRoutes);
        }
      }));
      return false;
    }
    return true;
  }
}
