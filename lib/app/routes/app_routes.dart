import 'package:flutter/material.dart';

import '../../features/admin/presentation/admin_dashboard_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/driver/presentation/driver_dashboard_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/booking/presentation/booking_list_screen.dart';

/// Centralized route names and route map for the application.
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String driverDashboard = '/driver-dashboard';
  static const String adminDashboard = '/admin-dashboard';
  static const String bookingList = '/booking-list';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
        login: (_) => const LoginScreen(),
        home: (_) => const HomeScreen(),
        driverDashboard: (_) => const DriverDashboardScreen(),
        adminDashboard: (_) => const AdminDashboardScreen(),
        bookingList: (_) => const BookingListScreen(),
      };
}