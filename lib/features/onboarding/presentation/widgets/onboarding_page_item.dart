import 'package:aleefy/core/components/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration / Icon Hero Container
          Container(
            width: 220.w,
            height: 220.h,
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
          SizedBox(height: 40.h),

          // Category Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: item.accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20.r),
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
          SizedBox(height: 16.h),

          // Title
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: AppTypography.heading1.copyWith(fontSize: 24.sp),
          ),
          SizedBox(height: 14.h),

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
