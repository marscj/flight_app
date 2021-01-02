import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:saadiyat/pages/booking/index.dart';
import 'package:saadiyat/pages/index/index_page.dart';
import 'package:saadiyat/store/store.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    // return Store.instance.getToken() != null;
    return true;
  }
}

@MaterialAutoRouter(
  // generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: IndexPage, initial: true),
    MaterialRoute(
        page: BookingRoutePage,
        path: '/bookings/:id',
        children: <AutoRoute>[
          MaterialRoute(
            path: '/',
            page: BookingPage,
          ),
        ]),
  ],
)
class $AppRouter {}
