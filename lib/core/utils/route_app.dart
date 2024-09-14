import 'package:banking_app/core/global_component/flutter_package.dart';
import 'package:banking_app/features/main/main_menu_screen.dart';
import 'package:flutter/material.dart';
import '../../features/main/splash_screen.dart';

class RouteApp {
  // Define route names
  static const String splash = '/';
  static const String main = '/main';

  // Define route settings
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainMenuScreen());
      default:
        // If no matching route, show a 404 page or error screen
        return MaterialPageRoute(
            builder: (_) => BaseWidgetContainer(
                    body: Center(
                  child: Text('No route defined for ${settings.name}'),
                )));
    }
  }
}
