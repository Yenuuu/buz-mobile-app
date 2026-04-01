import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

/// Reusable BuZ logo widget.
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.useCard = false,
    this.showText = false,
    this.showSubtitle = false,
    this.logoSize = 64,
    this.cardSize = 150,
  });

  final bool useCard;
  final bool showText;
  final bool showSubtitle;
  final double logoSize;
  final double cardSize;

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      'assets/images/logo.png',
      width: logoSize,
      height: logoSize,
      fit: BoxFit.contain,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (useCard)
          Container(
            width: cardSize,
            height: cardSize,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(34),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.14),
                  blurRadius: 26,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Center(child: logo),
          )
        else
          logo,
        if (showText) ...[
          const SizedBox(height: 22),
          const Text(
            'BuZ',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: -1,
              height: 1,
            ),
          ),
        ],
        if (showSubtitle) ...[
          const SizedBox(height: 12),
          const Text(
            'SMART BUS TRACKING SYSTEM',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ],
    );
  }
}