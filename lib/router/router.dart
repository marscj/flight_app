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
    MaterialRoute(page: BookingRoutePage, path: '/bookings/:id', children: [
      CupertinoRoute(
        path: '/',
        page: BookingPage,
      ),
    ]),
    // CupertinoRoute<Widget>(
    //   path: '/users/:id',
    //   page: UserPage,
    //   children: [
    //     CupertinoRoute(path: '/', page: UserProfilePage),
    //     CupertinoRoute(path: '/photo', page: UserPhotoPage),
    //     CupertinoRoute(
    //       path: '/post/:field?',
    //       page: UserPostPage,
    //     ),
    //     CupertinoRoute(path: '/emailvalidate/:email?', page: EmailValidatePage),
    //     CupertinoRoute(path: '/join', page: JoinPage)
    //   ],
    // ),
    // CupertinoRoute(
    //   path: '/faqs',
    //   page: FaqPage,
    // ),
    // CupertinoRoute(path: '/contract', page: ContractPage, children: [
    //   CupertinoRoute(path: '/', page: ContractListPage),
    //   CupertinoRoute(path: '/:id/post', page: ContractPost),
    // ]),
    // CupertinoRoute(path: '/address', page: AddressPage, children: [
    //   CupertinoRoute(path: '/', page: AddressListPage),
    //   CupertinoRoute(path: '/:id/post', page: AddressPostPage)
    // ])
  ],
)
class $AppRouter {}
