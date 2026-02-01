
import 'package:flutter/material.dart';
import 'package:machine_test_mohit/presentetion/bottombar/bottom_bar_screen/bottombar_screen.dart';
import 'package:machine_test_mohit/presentetion/splash/splash_screen.dart';

import '../presentetion/auth/login_screen/login_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String posts = '/posts';
  static const String login = '/login';
  static const String bottomnavScreen = '/bottombar';
  static const String splash = '/splash';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(), // default HOME
        );

      case bottomnavScreen:
        return MaterialPageRoute(
          builder: (_) => const BottomNavScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route not found")),
          ),
        );
    }
  }
}


// class AppRoutes {
//   static const String login = '/login';
//   static const String home = '/home';
//
//   static Map<String, WidgetBuilder> routes = {
//     login: (context) => const LoginScreen(),
//     home: (context) => const HomeScreen(),
//   };
// }