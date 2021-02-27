import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/pages/about/about_page.dart';
import 'package:saadiyat/pages/basement/basement_page.dart';
import 'package:saadiyat/pages/booking_create/Itinerary_edit.dart';
import 'package:saadiyat/pages/booking_create/booking_create_page.dart';
import 'package:saadiyat/pages/booking_detail/index.dart';
import 'package:saadiyat/pages/bookings/index.dart';
import 'package:saadiyat/pages/home/home_screen.dart';
import 'package:saadiyat/pages/login/login_page.dart';
import 'package:saadiyat/pages/my/change_password.dart';
import 'package:saadiyat/pages/my/index.dart';
import 'package:saadiyat/pages/my/passport.dart';
import 'package:saadiyat/pages/my/profile.dart';
import 'package:saadiyat/pages/support/index.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';
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
        path: BasementPage.routeName, page: BasementPage, guards: [AuthGuard]),
    AutoRoute(
      path: BookingsPage.routeName,
      page: BookingsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: MyPage.routeName,
      page: MyPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: AboutPage.routeName,
      page: AboutPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: BookingsPage.routeName + '/:id',
      page: BookingDetailPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: TicketsPage.routeName,
      page: TicketsPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: TicketsPage.routeName + '/:id',
      page: TicketDetailPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: BookingCreatePage.routeName,
      page: BookingCreatePage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: ItineraryEditPage.routeName,
      page: ItineraryEditPage,
      fullscreenDialog: true,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: ProfilePage.routeName,
      page: ProfilePage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: PassportPage.routeName,
      page: PassportPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: ChangePasswordPage.routeName,
      page: ChangePasswordPage,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: SupportPage.routeName,
      page: SupportPage,
      guards: [AuthGuard],
    ),
  ],
)
class $AppRouter {}
