// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'guard.dart' as _i3;
import '../pages/welcome/welcome_page.dart' as _i4;
import '../pages/login/login_page.dart' as _i5;
import '../pages/basement/basement_page.dart' as _i6;
import '../pages/home/index.dart' as _i7;
import '../pages/my/index.dart' as _i8;
import '../pages/bookings/index.dart' as _i9;
import '../pages/booking/index.dart' as _i10;
import '../pages/tickets/tickets_page.dart' as _i11;
import '../pages/ticket/ticket_page.dart' as _i12;

class AppRouter extends _i1.RootStackRouter {
  AppRouter({@_i2.required this.authGuard}) : assert(authGuard != null);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WelcomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.WelcomePage());
    },
    LoginRoute.name: (entry) {
      var route = entry.routeData.as<LoginRoute>();
      return _i1.MaterialPageX(
          entry: entry,
          child:
              _i5.LoginPage(key: route.key, onLoginResult: route.onLoginResult),
          fullscreenDialog: false);
    },
    BasementRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i6.BasementPage());
    },
    HomeTab.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i7.HomePage());
    },
    BookingTab.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i1.EmptyRouterPage());
    },
    TicketTab.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i1.EmptyRouterPage());
    },
    MyTab.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i8.MyPage());
    },
    BookingsScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i9.BookingsScreen());
    },
    BookingRoute.name: (entry) {
      var route = entry.routeData.as<BookingRoute>();
      return _i1.MaterialPageX(
          entry: entry, child: _i10.BookingPage(id: route.id));
    },
    TicketsRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i11.TicketsPage());
    },
    TicketRoute.name: (entry) {
      var route = entry.routeData.as<TicketRoute>();
      return _i1.MaterialPageX(
          entry: entry, child: _i12.TicketPage(id: route.id));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<WelcomeRoute>(WelcomeRoute.name,
            path: '/', routeBuilder: (_) => const WelcomeRoute()),
        _i1.RouteConfig<LoginRoute>(LoginRoute.name,
            path: '/login',
            routeBuilder: (match) => LoginRoute.fromMatch(match)),
        _i1.RouteConfig<BasementRoute>(BasementRoute.name,
            path: '/',
            usesTabsRouter: true,
            routeBuilder: (match) => BasementRoute.fromMatch(match),
            guards: [
              authGuard
            ],
            children: [
              _i1.RouteConfig<HomeTab>(HomeTab.name,
                  path: 'home', routeBuilder: (_) => const HomeTab()),
              _i1.RouteConfig<BookingTab>(BookingTab.name,
                  path: 'bookings',
                  routeBuilder: (match) => BookingTab.fromMatch(match),
                  children: [
                    _i1.RouteConfig('#redirect',
                        path: '', redirectTo: 'list', fullMatch: true),
                    _i1.RouteConfig<BookingsScreen>(BookingsScreen.name,
                        path: 'list',
                        routeBuilder: (_) => const BookingsScreen()),
                    _i1.RouteConfig<BookingRoute>(BookingRoute.name,
                        path: 'list/:id',
                        routeBuilder: (match) => BookingRoute.fromMatch(match))
                  ]),
              _i1.RouteConfig<TicketTab>(TicketTab.name,
                  path: 'tickets',
                  routeBuilder: (match) => TicketTab.fromMatch(match),
                  children: [
                    _i1.RouteConfig('#redirect',
                        path: '', redirectTo: 'list', fullMatch: true),
                    _i1.RouteConfig<TicketsRoute>(TicketsRoute.name,
                        path: 'list',
                        routeBuilder: (_) => const TicketsRoute()),
                    _i1.RouteConfig<TicketRoute>(TicketRoute.name,
                        path: 'list/:id',
                        routeBuilder: (match) => TicketRoute.fromMatch(match),
                        guards: [authGuard])
                  ]),
              _i1.RouteConfig<MyTab>(MyTab.name,
                  path: 'my', routeBuilder: (_) => const MyTab())
            ])
      ];
}

class WelcomeRoute extends _i1.PageRouteInfo {
  const WelcomeRoute() : super(name, path: '/');

  static const String name = 'WelcomeRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  LoginRoute({this.key, this.onLoginResult})
      : super(name, path: '/login', argProps: [key, onLoginResult]);

  LoginRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        onLoginResult = null,
        super.fromMatch(match);

  final _i2.Key key;

  final void Function(bool) onLoginResult;

  static const String name = 'LoginRoute';
}

class BasementRoute extends _i1.PageRouteInfo {
  const BasementRoute({List<_i1.PageRouteInfo> children})
      : super(name, path: '/', initialChildren: children);

  BasementRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'BasementRoute';
}

class HomeTab extends _i1.PageRouteInfo {
  const HomeTab() : super(name, path: 'home');

  static const String name = 'HomeTab';
}

class BookingTab extends _i1.PageRouteInfo {
  const BookingTab({List<_i1.PageRouteInfo> children})
      : super(name, path: 'bookings', initialChildren: children);

  BookingTab.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'BookingTab';
}

class TicketTab extends _i1.PageRouteInfo {
  const TicketTab({List<_i1.PageRouteInfo> children})
      : super(name, path: 'tickets', initialChildren: children);

  TicketTab.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'TicketTab';
}

class MyTab extends _i1.PageRouteInfo {
  const MyTab() : super(name, path: 'my');

  static const String name = 'MyTab';
}

class BookingsScreen extends _i1.PageRouteInfo {
  const BookingsScreen() : super(name, path: 'list');

  static const String name = 'BookingsScreen';
}

class BookingRoute extends _i1.PageRouteInfo {
  BookingRoute({this.id})
      : super(name, path: 'list/:id', params: {'id': id}, argProps: [id]);

  BookingRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'BookingRoute';
}

class TicketsRoute extends _i1.PageRouteInfo {
  const TicketsRoute() : super(name, path: 'list');

  static const String name = 'TicketsRoute';
}

class TicketRoute extends _i1.PageRouteInfo {
  TicketRoute({this.id})
      : super(name, path: 'list/:id', params: {'id': id}, argProps: [id]);

  TicketRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'TicketRoute';
}
