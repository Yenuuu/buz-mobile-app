import 'package:flutter/material.dart';

import '../../features/admin/presentation/admin_dashboard_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/booking/presentation/booking_list_screen.dart';
import '../../features/booking/presentation/seat_selection_screen.dart';
import '../../features/driver/presentation/driver_dashboard_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/tracking/presentation/tracking_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String bookingList = '/booking-list';
  static const String seatSelection = '/seat-selection';
  static const String driverDashboard = '/driver-dashboard';
  static const String adminDashboard = '/admin-dashboard';
  static const String tracking = '/tracking';


  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    home: (_) => const HomeScreen(),
    bookingList: (_) => const BookingListScreen(),
    seatSelection: (_) => const SeatSelectionScreen(),
    driverDashboard: (_) => const DriverDashboardScreen(),
    adminDashboard: (_) => const AdminDashboardScreen(),
    tracking: (_) => const TrackingScreen(),
  };
}