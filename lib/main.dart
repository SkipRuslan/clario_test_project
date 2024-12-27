import 'package:auto_route/auto_route.dart';
import 'package:clario_test_project/router/app_router.dart';
import 'package:clario_test_project/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: serviceLocator<AppRouter>().defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        serviceLocator<AppRouter>(),
        navigatorObservers: () => [AutoRouteObserver()],
      ),
    );
  }
}
