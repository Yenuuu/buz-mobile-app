import 'package:flutter/material.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';

/// Centralized route names and route map for the application.
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
        login: (_) => const LoginScreen(),
      };
}