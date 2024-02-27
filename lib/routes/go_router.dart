import 'package:animation_pro/main.dart';
import 'package:animation_pro/pages/second_page.dart';
import 'package:go_router/go_router.dart';

abstract class RoutesManager {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'secondPage',
            builder: (context, state) => const SecondPage(),
          ),
          // GoRoute(
          //   path: 'secondPage',
          //   builder: (context, state) => const SecondPage(),
          // ),
        ],
      ),
      GoRoute(
        path: '/settingsPage',
        builder: (context, state) => const SettingsPage(),
      )
    ],
  );
}
