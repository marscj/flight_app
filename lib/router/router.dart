import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/pages/booking/index.dart';
import 'package:saadiyat/pages/index/index_page.dart';
import 'guard.dart';

@MaterialAutoRouter(
  // generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: IndexPage, initial: true),
    MaterialRoute(
        page: BookingRoutePage,
        path: '/bookings/',
        children: <AutoRoute>[
          MaterialRoute(path: ':id/', page: BookingPage, guards: [AuthGuard]),
        ]),
  ],
)
class $AppRouter {}
