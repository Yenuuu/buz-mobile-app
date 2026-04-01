import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/app_logo.dart';

/// Initial splash screen shown when the application starts.
///
/// Uses a centered layout for the logo block and a fixed bottom
/// loading label to match the design more accurately.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            // Main centered logo/content block
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: AppLogo(
                  useCard: true,
                  showText: true,
                  showSubtitle: true,
                  logoSize: 92,
                  cardSize: 160,
                ),
              ),
            ),

            // Bottom loading text
            const Positioned(
              left: 0,
              right: 0,
              bottom: 34,
              child: Center(
                child: Text(
                  'INITIALIZING REAL-TIME DATA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.accentSoft,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}