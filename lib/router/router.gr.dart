// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'guard.dart' as _i3;
import '../pages/index/index_page.dart' as _i4;
import '../pages/home/index.dart' as _i5;
import '../pages/my/index.dart' as _i6;
import '../pages/bookings/index.dart' as _i7;
import '../pages/booking/index.dart' as _i8;
import '../pages/tickets/tickets_page.dart' as _i9;
import '../pages/ticket/ticket_page.dart' as _i10;

class AppRouter extends _i1.RootStackRouter {
  AppRouter({@_i2.required this.authGuard}) : assert(authGuard != null);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    IndexRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.IndexPage());
    },
    HomeTab.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.HomePage());
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
      return _i1.MaterialPageX(entry: entry, child: _i6.MyPage());
    },
    BookingsScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i7.BookingsScreen());
    },
    BookingRoute.name: (entry) {
      var route = entry.routeData.as<BookingRoute>();
      return _i1.MaterialPageX(
          entry: entry, child: _i8.BookingPage(id: route.id));
    },
    TicketsRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i9.TicketsPage());
    },
    TicketRoute.name: (entry) {
      var route = entry.routeData.as<TicketRoute>();
      return _i1.MaterialPageX(
          entry: entry, child: _i10.TicketPage(id: route.id));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<IndexRoute>(IndexRoute.name,
            path: '/',
            usesTabsRouter: true,
            routeBuilder: (match) => IndexRoute.fromMatch(match),
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
                        routeBuilder: (match) => BookingRoute.fromMatch(match),
                        guards: [authGuard])
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

class IndexRoute extends _i1.PageRouteInfo {
  const IndexRoute({List<_i1.PageRouteInfo> children})
      : super(name, path: '/', initialChildren: children);

  IndexRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'IndexRoute';
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
