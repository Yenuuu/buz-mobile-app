import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

/// Initial splash screen shown when the application starts.
///
/// Later, this screen can be extended to:
/// - initialize services
/// - check authentication state
/// - navigate to login or home
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Temporary delay for splash preview.
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      // TODO(Yenuli): Replace with actual navigation when login screen is ready.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),

              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.16),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_on,
                    size: 72,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'BuZ',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  letterSpacing: -1,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'SMART BUS TRACKING SYSTEM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),

              const Spacer(),

              const Padding(
                padding: EdgeInsets.only(bottom: 28),
                child: Text(
                  'INITIALIZING REAL-TIME DATA',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.accentSoft,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}