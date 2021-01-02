import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saadiyat/router/router.dart';
import './router/router.gr.dart';

import 'app/app_bloc.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _EletecAppState();
}

class _EletecAppState extends State<App> {
  @override
  Widget build(BuildContext context) => BlocListener<AppBloc, AppState>(
      listener: (_, __) {},
      child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        return MaterialApp(
          title: 'Saadiyat',
          builder: ExtendedNavigator.builder<AppRouter>(
            router: AppRouter(),
            guards: [AuthGuard()],
            builder: (context, child) => child,
          ),
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
                        displayColor: Colors.indigo, bodyColor: Colors.indigo),
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
