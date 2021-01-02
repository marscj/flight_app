import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saadiyat/router/guard.dart';
import 'package:saadiyat/router/router.gr.dart';

import 'app_bloc.dart';
import 'app_state.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter(authGuard: AuthGuard(context));
    return BlocListener<AppBloc, AppState>(
        listener: (
          BuildContext context,
          AppState currentState,
        ) {},
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return MaterialApp.router(
            title: 'Saadiyat',
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            builder: (context, router) {
              return router;
            },
            theme: ThemeData(
                primarySwatch: Colors.indigo,
                accentColor: Colors.indigoAccent,
                scaffoldBackgroundColor: Colors.grey[200],
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: <TargetPlatform, PageTransitionsBuilder>{
                    TargetPlatform.android: ZoomPageTransitionsBuilder(),
                    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
                  },
                ),
                buttonTheme: ButtonThemeData(
                    buttonColor: Colors.indigo,
                    hoverColor: Colors.indigo,
                    textTheme: ButtonTextTheme.primary),
                appBarTheme: AppBarTheme(
                    elevation: 0,
                    color: Colors.grey[200],
                    iconTheme: IconThemeData(color: Colors.indigo),
                    textTheme: GoogleFonts.righteousTextTheme(
                      Theme.of(context).textTheme.apply(
                          displayColor: Colors.indigo,
                          bodyColor: Colors.indigo),
                    ),
                    brightness: Brightness.light),
                dividerColor: Colors.grey,
                textTheme: GoogleFonts.righteousTextTheme(
                  Theme.of(context).textTheme,
                ),
                highlightColor: Colors.blueAccent,
                hoverColor: Colors.blueAccent.withOpacity(0.04),
                splashColor: Colors.blueAccent),
          );
        }));
  }
}
