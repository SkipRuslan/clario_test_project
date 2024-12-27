import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Tab|Wrapper ,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignUpRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
