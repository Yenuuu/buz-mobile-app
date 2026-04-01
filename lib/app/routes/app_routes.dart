import 'package:flutter/material.dart';

import '../../features/splash/presentation/splash_screen.dart';

/// Centralized route names and route map.
class AppRoutes {
  static const String splash = '/';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
      };
}