import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/pages/basement/index.dart';
import 'package:saadiyat/pages/booking/index.dart';
import 'package:saadiyat/pages/bookings/index.dart';
import 'package:saadiyat/pages/home/index.dart';
import 'package:saadiyat/pages/index/index_page.dart';
import 'package:saadiyat/pages/ticket/ticket_page.dart';
import 'package:saadiyat/pages/tickets/tickets_page.dart';
import 'package:saadiyat/ticket/index.dart';
import 'package:saadiyat/tickets/index.dart';
import 'guard.dart';

@MaterialAutoRouter(
  routes: <MaterialRoute>[
    MaterialRoute(
        path: IndexPage.routeName,
        page: IndexPage,
        usesTabsRouter: true,
        children: [
          MaterialRoute(path: HomePage.routeName, page: HomePage, name: 'home'),
          AutoRoute(
            path: BookingsPage.routeName,
            page: EmptyRouterPage,
            name: 'bookings',
            children: [
              AutoRoute(path: '', page: BookingsScreen),
              AutoRoute(
                path: ':id',
                page: BookingPage,
                guards: [AuthGuard],
              ),
            ],
          ),
          AutoRoute(
            path: TicketsPage.routeName,
            page: EmptyRouterPage,
            name: 'tickets',
            children: [
              AutoRoute(path: '', page: TicketsPage),
              AutoRoute(
                path: ':id',
                page: TicketPage,
                guards: [AuthGuard],
              ),
            ],
          )
        ]),
  ],
)
class $AppRouter {}
