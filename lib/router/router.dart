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

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: WelcomePage.routeName, page: WelcomePage, initial: true),
    AutoRoute(
        path: LoginPage.routeName, page: LoginPage, fullscreenDialog: false),
    AutoRoute(
        path: BasementPage.routeName,
        page: BasementPage,
        usesTabsRouter: true,
        guards: [
          AuthGuard
        ],
        children: [
          AutoRoute(path: HomePage.routeName, page: HomePage, name: 'homeTab'),
          AutoRoute(
            path: BookingsPage.routeName,
            page: EmptyRouterPage,
            name: 'bookingTab',
            children: [
              RedirectRoute(path: '', redirectTo: 'list'),
              AutoRoute(path: 'list', page: BookingsPage),
            ],
          ),
          AutoRoute(
            path: TicketsPage.routeName,
            page: EmptyRouterPage,
            name: 'ticketTab',
            children: [
              RedirectRoute(path: '', redirectTo: 'list'),
              AutoRoute(path: 'list', page: TicketsPage),
            ],
          ),
          AutoRoute(path: MyPage.routeName, page: MyPage, name: 'myTab'),
        ]),
    AutoRoute(
      path: BookingsPage.routeName + '/:id',
      page: BookingPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: TicketsPage.routeName + '/:id',
      page: TicketPage,
      guards: [AuthGuard],
    ),
  ],
)
class $AppRouter {}
