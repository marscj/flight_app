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
import '../pages/bookings/index.dart' as _i7;
import '../pages/my/index.dart' as _i8;
import '../pages/booking_detail/index.dart' as _i9;
import '../pages/tickets/tickets_page.dart' as _i10;
import '../pages/ticket_detail/index.dart' as _i11;
import '../pages/booking_create/booking_create_page.dart' as _i12;
import '../pages/booking_create/Itinerary_edit.dart' as _i13;
import '../pages/my/profile.dart' as _i14;
import '../pages/my/passport.dart' as _i15;
import '../pages/my/change_password.dart' as _i16;
import '../pages/support/index.dart' as _i17;
import '../apis/client.dart' as _i18;

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
    BookingsRoute.name: (entry) {
      return _i1.CupertinoPageX(entry: entry, child: _i7.BookingsPage());
    },
    MyRoute.name: (entry) {
      return _i1.CupertinoPageX(entry: entry, child: _i8.MyPage());
    },
    BookingDetailRoute.name: (entry) {
      var route = entry.routeData.as<BookingDetailRoute>();
      return _i1.CupertinoPageX(
          entry: entry, child: _i9.BookingDetailPage(id: route.id));
    },
    TicketsRoute.name: (entry) {
      return _i1.CupertinoPageX(entry: entry, child: _i10.TicketsPage());
    },
    TicketDetailRoute.name: (entry) {
      var route = entry.routeData.as<TicketDetailRoute>();
      return _i1.CupertinoPageX(
          entry: entry, child: _i11.TicketDetailPage(id: route.id));
    },
    BookingCreateRoute.name: (entry) {
      return _i1.CupertinoPageX(entry: entry, child: _i12.BookingCreatePage());
    },
    ItineraryEditRoute.name: (entry) {
      var route = entry.routeData.as<ItineraryEditRoute>();
      return _i1.CupertinoPageX(
          entry: entry,
          child: _i13.ItineraryEditPage(
              key: route.key,
              booking: route.booking,
              data: route.data,
              onResult: route.onResult),
          fullscreenDialog: true);
    },
    ProfileRoute.name: (entry) {
      var route = entry.routeData.as<ProfileRoute>();
      return _i1.CupertinoPageX(
          entry: entry, child: _i14.ProfilePage(key: route.key));
    },
    PassportRoute.name: (entry) {
      var route = entry.routeData.as<PassportRoute>();
      return _i1.CupertinoPageX(
          entry: entry, child: _i15.PassportPage(key: route.key));
    },
    ChangePasswordRoute.name: (entry) {
      var route = entry.routeData.as<ChangePasswordRoute>();
      return _i1.CupertinoPageX(
          entry: entry, child: _i16.ChangePasswordPage(key: route.key));
    },
    SupportRoute.name: (entry) {
      var route = entry.routeData.as<SupportRoute>();
      return _i1.CupertinoPageX(
          entry: entry,
          child: _i17.SupportPage(key: route.key, data: route.data));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<WelcomeRoute>(WelcomeRoute.name,
            path: '/', routeBuilder: (match) => WelcomeRoute.fromMatch(match)),
        _i1.RouteConfig<LoginRoute>(LoginRoute.name,
            path: '/login',
            routeBuilder: (match) => LoginRoute.fromMatch(match)),
        _i1.RouteConfig<BasementRoute>(BasementRoute.name,
            path: '/',
            routeBuilder: (match) => BasementRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<BookingsRoute>(BookingsRoute.name,
            path: 'bookings',
            routeBuilder: (match) => BookingsRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<MyRoute>(MyRoute.name,
            path: 'my',
            routeBuilder: (match) => MyRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<BookingDetailRoute>(BookingDetailRoute.name,
            path: 'bookings/:id',
            routeBuilder: (match) => BookingDetailRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<TicketsRoute>(TicketsRoute.name,
            path: 'tickets',
            routeBuilder: (match) => TicketsRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<TicketDetailRoute>(TicketDetailRoute.name,
            path: 'tickets/:id',
            routeBuilder: (match) => TicketDetailRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<BookingCreateRoute>(BookingCreateRoute.name,
            path: '/bookingCreate',
            routeBuilder: (match) => BookingCreateRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<ItineraryEditRoute>(ItineraryEditRoute.name,
            path: '/itineraryEdit',
            routeBuilder: (match) => ItineraryEditRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<ProfileRoute>(ProfileRoute.name,
            path: 'profile',
            routeBuilder: (match) => ProfileRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<PassportRoute>(PassportRoute.name,
            path: 'passport',
            routeBuilder: (match) => PassportRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<ChangePasswordRoute>(ChangePasswordRoute.name,
            path: 'change_password',
            routeBuilder: (match) => ChangePasswordRoute.fromMatch(match),
            guards: [authGuard]),
        _i1.RouteConfig<SupportRoute>(SupportRoute.name,
            path: '/support',
            routeBuilder: (match) => SupportRoute.fromMatch(match),
            guards: [authGuard])
      ];
}

class WelcomeRoute extends _i1.PageRouteInfo {
  const WelcomeRoute() : super(name, path: '/');

  WelcomeRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'WelcomeRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  LoginRoute({this.key, this.onLoginResult}) : super(name, path: '/login');

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

  BasementRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'BasementRoute';
}

class BookingsRoute extends _i1.PageRouteInfo {
  const BookingsRoute() : super(name, path: 'bookings');

  BookingsRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'BookingsRoute';
}

class MyRoute extends _i1.PageRouteInfo {
  const MyRoute() : super(name, path: 'my');

  MyRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'MyRoute';
}

class BookingDetailRoute extends _i1.PageRouteInfo {
  BookingDetailRoute({this.id})
      : super(name, path: 'bookings/:id', params: {'id': id});

  BookingDetailRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'BookingDetailRoute';
}

class TicketsRoute extends _i1.PageRouteInfo {
  const TicketsRoute() : super(name, path: 'tickets');

  TicketsRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'TicketsRoute';
}

class TicketDetailRoute extends _i1.PageRouteInfo {
  TicketDetailRoute({this.id})
      : super(name, path: 'tickets/:id', params: {'id': id});

  TicketDetailRoute.fromMatch(_i1.RouteMatch match)
      : id = match.pathParams.getInt('id'),
        super.fromMatch(match);

  final int id;

  static const String name = 'TicketDetailRoute';
}

class BookingCreateRoute extends _i1.PageRouteInfo {
  const BookingCreateRoute() : super(name, path: '/bookingCreate');

  BookingCreateRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'BookingCreateRoute';
}

class ItineraryEditRoute extends _i1.PageRouteInfo {
  ItineraryEditRoute({this.key, this.booking, this.data, this.onResult})
      : super(name, path: '/itineraryEdit');

  ItineraryEditRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        booking = null,
        data = null,
        onResult = null,
        super.fromMatch(match);

  final _i2.Key key;

  final _i18.Booking booking;

  final _i18.Itinerary data;

  final dynamic Function(bool) onResult;

  static const String name = 'ItineraryEditRoute';
}

class ProfileRoute extends _i1.PageRouteInfo {
  ProfileRoute({this.key}) : super(name, path: 'profile');

  ProfileRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        super.fromMatch(match);

  final _i2.Key key;

  static const String name = 'ProfileRoute';
}

class PassportRoute extends _i1.PageRouteInfo {
  PassportRoute({this.key}) : super(name, path: 'passport');

  PassportRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        super.fromMatch(match);

  final _i2.Key key;

  static const String name = 'PassportRoute';
}

class ChangePasswordRoute extends _i1.PageRouteInfo {
  ChangePasswordRoute({this.key}) : super(name, path: 'change_password');

  ChangePasswordRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        super.fromMatch(match);

  final _i2.Key key;

  static const String name = 'ChangePasswordRoute';
}

class SupportRoute extends _i1.PageRouteInfo {
  SupportRoute({this.key, @_i2.required this.data})
      : super(name, path: '/support');

  SupportRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        data = null,
        super.fromMatch(match);

  final _i2.Key key;

  final _i18.Ticket data;

  static const String name = 'SupportRoute';
}
