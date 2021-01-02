// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/booking/index.dart';
import '../pages/index/index_page.dart';

class Routes {
  static const String indexPage = '/';
  static const String _bookingRoutePage = '/bookings/:id';
  static String bookingRoutePage({@required dynamic id}) => '/bookings/$id';
  static const all = <String>{
    indexPage,
    _bookingRoutePage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexPage, page: IndexPage),
    RouteDef(
      Routes._bookingRoutePage,
      page: BookingRoutePage,
      generator: BookingRoutePageRouter(),
    ),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexPage(),
        settings: data,
      );
    },
    BookingRoutePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BookingRoutePage(),
        settings: data,
      );
    },
  };
}

class BookingRoutePageRoutes {
  static const String bookingPage = '/';
  static const all = <String>{
    bookingPage,
  };
}

class BookingRoutePageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(BookingRoutePageRoutes.bookingPage, page: BookingPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    BookingPage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => BookingPage(),
        settings: data,
      );
    },
  };
}
