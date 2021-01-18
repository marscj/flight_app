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
import '../pages/booking_detail/index.dart' as _i7;
import '../pages/ticket_detail/index.dart' as _i8;
import '../pages/booking_create/booking_create_page.dart' as _i9;
import '../pages/booking_create/Itinerary_edit.dart' as _i10;
import '../apis/client.dart' as _i11;

class AppRouter extends _i1.RootStackRouter {
  AppRouter({@_i2.required this.authGuard}) : assert(authGuard != null);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WelcomeRoute.name: (entry) {
      return _i1.CupertinoPageX(entry: entry, child: _i4.WelcomePage());
    },
    LoginRoute.name: (entry) {
      var route = entry.routeData.as<LoginRoute>();
      return _i1.CupertinoPageX(
          entry: entry,
          child:
              _i5.LoginPage(key: route.key, onLoginResult: route.onLoginResult),
          fullscreenDialog: false);
    },
    BasementRoute.name: (entry) {
      return _i1.CupertinoPageX(entry: entry, child: _i6.BasementPage());
    },
    BookingDetailRoute.name: (entry) {
      var route = entry.routeData.as<BookingDetailRoute>();
      return _i1.CupertinoPageX(
          entry: entry, child: _i7.BookingDetailPage(id: route.id));
    },
    TicketDetailRoute.name: (entry) {
      var route = entry.routeData.as<TicketDetailRoute>();
      return _i1.CupertinoPageX(
          entry: entry, child: _i8.TicketDetailPage(id: route.id));
    },
    BookingCreateRoute.name: (entry) {
      return _i1.CupertinoPageX(entry: entry, child: _i9.BookingCreatePage());
    },
    ItineraryEditRoute.name: (entry) {
      var route = entry.routeData.as<ItineraryEditRoute>();
      return _i1.CupertinoPageX(
          entry: entry,
          child: _i10.ItineraryEditPage(
              key: route.key,
              booking: route.booking,
              data: route.data,
              onResult: route.onResult),
          fullscreenDialog: true);
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
            routeBuilder: (_) => const BasementRoute(),
            guards: [authGuard]),
        _i1.RouteConfig<BookingDetailRoute>(BookingDetailRoute.name,
            path: 'bookings/:id',
            routeBuilder: (match) => BookingDetailRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<TicketDetailRoute>(TicketDetailRoute.name,
            path: 'tickets/:id',
            routeBuilder: (match) => TicketDetailRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<BookingCreateRoute>(BookingCreateRoute.name,
            path: '/bookingCreate',
            routeBuilder: (_) => const BookingCreateRoute(),
            guards: [authGuard]),
        _i1.RouteConfig<ItineraryEditRoute>(ItineraryEditRoute.name,
            path: '/itineraryEdit',
            routeBuilder: (match) => ItineraryEditRoute.fromMatch(match),
            guards: [authGuard])
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
  const BasementRoute() : super(name, path: '/');

  static const String name = 'BasementRoute';
}

class BookingDetailRoute extends _i1.PageRouteInfo {
  BookingDetailRoute({this.id})
      : super(name, path: 'bookings/:id', params: {'id': id}, argProps: [id]);

  BookingDetailRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'BookingDetailRoute';
}

class TicketDetailRoute extends _i1.PageRouteInfo {
  TicketDetailRoute({this.id})
      : super(name, path: 'tickets/:id', params: {'id': id}, argProps: [id]);

  TicketDetailRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'TicketDetailRoute';
}

class BookingCreateRoute extends _i1.PageRouteInfo {
  const BookingCreateRoute() : super(name, path: '/bookingCreate');

  static const String name = 'BookingCreateRoute';
}

class ItineraryEditRoute extends _i1.PageRouteInfo {
  ItineraryEditRoute({this.key, this.booking, this.data, this.onResult})
      : super(name,
            path: '/itineraryEdit', argProps: [key, booking, data, onResult]);

  ItineraryEditRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        booking = null,
        data = null,
        onResult = null,
        super.fromMatch(match);

  final _i2.Key key;

  final _i11.Booking booking;

  final _i11.Itinerary data;

  final void Function(_i11.Booking) onResult;

  static const String name = 'ItineraryEditRoute';
}
