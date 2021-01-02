// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'guard.dart' as _i3;
import '../pages/index/index_page.dart' as _i4;
import '../pages/booking/index.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter({@_i2.required this.authGuard}) : assert(authGuard != null);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    IndexPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.IndexPage());
    },
    BookingRoutePageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.BookingRoutePage());
    },
    BookingPageRoute.name: (entry) {
      var route = entry.routeData.as<BookingPageRoute>();
      return _i1.MaterialPageX(
          entry: entry, child: _i5.BookingPage(id: route.id));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<IndexPageRoute>(IndexPageRoute.name,
            path: '/', routeBuilder: (_) => const IndexPageRoute()),
        _i1.RouteConfig<BookingRoutePageRoute>(BookingRoutePageRoute.name,
            path: '/bookings/',
            routeBuilder: (match) => BookingRoutePageRoute.fromMatch(match),
            children: [
              _i1.RouteConfig<BookingPageRoute>(BookingPageRoute.name,
                  path: ':id/',
                  routeBuilder: (match) => BookingPageRoute.fromMatch(match),
                  guards: [authGuard])
            ])
      ];
}

class IndexPageRoute extends _i1.PageRouteInfo {
  const IndexPageRoute() : super(name, path: '/');

  static const String name = 'IndexPageRoute';
}

class BookingRoutePageRoute extends _i1.PageRouteInfo {
  const BookingRoutePageRoute({List<_i1.PageRouteInfo> children})
      : super(name, path: '/bookings/', initialChildren: children);

  BookingRoutePageRoute.fromMatch(_i1.RouteMatch match)
      : super.fromMatch(match);

  static const String name = 'BookingRoutePageRoute';
}

class BookingPageRoute extends _i1.PageRouteInfo {
  BookingPageRoute({this.id})
      : super(name, path: ':id/', params: {'id': id}, argProps: [id]);

  BookingPageRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'BookingPageRoute';
}
