import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

/// Root widget of the BuZ application.
class BuZApp extends StatelessWidget {
  const BuZApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuZ',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}