// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'guard.dart' as _i3;
import '../pages/index/index_page.dart' as _i4;
import '../pages/home/index.dart' as _i5;
import '../pages/bookings/index.dart' as _i6;
import '../pages/booking/index.dart' as _i7;
import '../pages/tickets/tickets_page.dart' as _i8;
import '../pages/ticket/ticket_page.dart' as _i9;

class AppRouter extends _i1.RootStackRouter {
  AppRouter({@_i2.required this.authGuard}) : assert(authGuard != null);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    IndexPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.IndexPage());
    },
    Home.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.HomePage());
    },
    Bookings.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i1.EmptyRouterPage());
    },
    Tickets.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i1.EmptyRouterPage());
    },
    BookingsScreenRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i6.BookingsScreen());
    },
    BookingPageRoute.name: (entry) {
      var route = entry.routeData.as<BookingPageRoute>();
      return _i1.MaterialPageX(
          entry: entry, child: _i7.BookingPage(id: route.id));
    },
    TicketsPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i8.TicketsPage());
    },
    TicketPageRoute.name: (entry) {
      var route = entry.routeData.as<TicketPageRoute>();
      return _i1.MaterialPageX(
          entry: entry, child: _i9.TicketPage(id: route.id));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<IndexPageRoute>(IndexPageRoute.name,
            path: '/',
            usesTabsRouter: true,
            routeBuilder: (match) => IndexPageRoute.fromMatch(match),
            children: [
              _i1.RouteConfig<Home>(Home.name,
                  path: 'home', routeBuilder: (_) => const Home()),
              _i1.RouteConfig<Bookings>(Bookings.name,
                  path: 'bookings',
                  routeBuilder: (match) => Bookings.fromMatch(match),
                  children: [
                    _i1.RouteConfig<BookingsScreenRoute>(
                        BookingsScreenRoute.name,
                        path: '',
                        routeBuilder: (_) => const BookingsScreenRoute()),
                    _i1.RouteConfig<BookingPageRoute>(BookingPageRoute.name,
                        path: ':id',
                        routeBuilder: (match) =>
                            BookingPageRoute.fromMatch(match),
                        guards: [authGuard])
                  ]),
              _i1.RouteConfig<Tickets>(Tickets.name,
                  path: 'tickets',
                  routeBuilder: (match) => Tickets.fromMatch(match),
                  children: [
                    _i1.RouteConfig<TicketsPageRoute>(TicketsPageRoute.name,
                        path: '',
                        routeBuilder: (_) => const TicketsPageRoute()),
                    _i1.RouteConfig<TicketPageRoute>(TicketPageRoute.name,
                        path: ':id',
                        routeBuilder: (match) =>
                            TicketPageRoute.fromMatch(match),
                        guards: [authGuard])
                  ])
            ])
      ];
}

class IndexPageRoute extends _i1.PageRouteInfo {
  const IndexPageRoute({List<_i1.PageRouteInfo> children})
      : super(name, path: '/', initialChildren: children);

  IndexPageRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'IndexPageRoute';
}

class Home extends _i1.PageRouteInfo {
  const Home() : super(name, path: 'home');

  static const String name = 'Home';
}

class Bookings extends _i1.PageRouteInfo {
  const Bookings({List<_i1.PageRouteInfo> children})
      : super(name, path: 'bookings', initialChildren: children);

  Bookings.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'Bookings';
}

class Tickets extends _i1.PageRouteInfo {
  const Tickets({List<_i1.PageRouteInfo> children})
      : super(name, path: 'tickets', initialChildren: children);

  Tickets.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'Tickets';
}

class BookingsScreenRoute extends _i1.PageRouteInfo {
  const BookingsScreenRoute() : super(name, path: '');

  static const String name = 'BookingsScreenRoute';
}

class BookingPageRoute extends _i1.PageRouteInfo {
  BookingPageRoute({this.id})
      : super(name, path: ':id', params: {'id': id}, argProps: [id]);

  BookingPageRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'BookingPageRoute';
}

class TicketsPageRoute extends _i1.PageRouteInfo {
  const TicketsPageRoute() : super(name, path: '');

  static const String name = 'TicketsPageRoute';
}

class TicketPageRoute extends _i1.PageRouteInfo {
  TicketPageRoute({this.id})
      : super(name, path: ':id', params: {'id': id}, argProps: [id]);

  TicketPageRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'TicketPageRoute';
}
