import 'package:flutter/material.dart';

/// Centralized app color palette.
///
/// Keep all reusable colors here to avoid hardcoding values
/// across multiple screens.
class AppColors {
  static const Color primary = Color(0xFF4A7BFF);
  static const Color primaryLight = Color(0xFF5B8CFF);

  // Updated to better match the soft blue tone from the splash/login design.
  static const Color background = Color(0xFFEFF3FF);

  static const Color white = Colors.white;
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF7B8794);
  static const Color accentSoft = Color(0xFF7EA1FF);

  // Extra UI helper colors.
  static const Color inputFill = Color(0xFFF1F4F9);
  static const Color inputIcon = Color(0xFF8A94A6);
}