import 'package:aleefy/core/components/custom_images.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/onboarding_item.dart';

/// ويدجت الشريحة الواحدة داخل الـ PageView
class OnboardingPageItem extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPageItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration / Icon Hero Container
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              color: item.accentColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: item.accentColor.withValues(alpha: 0.2),
                width: 2,
              ),
            ),
            child: Center(child: CustomSvgIconWidget(path: item.imageUrl)),
          ),
          const SizedBox(height: 40),

          // Category Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: item.accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              item.badgeText,
              style: AppTypography.caption.copyWith(
                color: item.accentColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Title
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: AppTypography.heading1.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 14),

          // Description
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
