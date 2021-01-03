import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/pages/basement/basement_page.dart';
import 'package:saadiyat/pages/booking/index.dart';
import 'package:saadiyat/pages/bookings/index.dart';
import 'package:saadiyat/pages/home/index.dart';
import 'package:saadiyat/pages/login/login_page.dart';
import 'package:saadiyat/pages/my/index.dart';
import 'package:saadiyat/pages/ticket/ticket_page.dart';
import 'package:saadiyat/pages/tickets/tickets_page.dart';
import 'package:saadiyat/pages/welcome/welcome_page.dart';
import 'guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <MaterialRoute>[
    MaterialRoute(
        path: WelcomePage.routeName, page: WelcomePage, initial: true),
    MaterialRoute(
        path: LoginPage.routeName, page: LoginPage, fullscreenDialog: false),
    MaterialRoute(
        path: BasementPage.routeName,
        page: BasementPage,
        usesTabsRouter: true,
        guards: [
          AuthGuard
        ],
        children: [
          MaterialRoute(
              path: HomePage.routeName, page: HomePage, name: 'homeTab'),
          MaterialRoute(
            path: BookingsPage.routeName,
            page: EmptyRouterPage,
            name: 'bookingTab',
            children: [
              RedirectRoute(path: '', redirectTo: 'list'),
              AutoRoute(path: 'list', page: BookingsScreen),
              AutoRoute(
                path: 'list/:id',
                page: BookingPage,
              ),
            ],
          ),
          MaterialRoute(
            path: TicketsPage.routeName,
            page: EmptyRouterPage,
            name: 'ticketTab',
            children: [
              RedirectRoute(path: '', redirectTo: 'list'),
              AutoRoute(path: 'list', page: TicketsPage),
              AutoRoute(
                path: 'list/:id',
                page: TicketPage,
                guards: [AuthGuard],
              ),
            ],
          ),
          MaterialRoute(path: MyPage.routeName, page: MyPage, name: 'myTab'),
        ]),
  ],
)
class $AppRouter {}
