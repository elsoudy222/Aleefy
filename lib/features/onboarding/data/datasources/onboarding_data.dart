import 'package:aleefy/core/constants/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/onboarding_item.dart';

/// مصدر بيانات شاشات التعريف (Onboarding Data Source)
///
/// تصميم عالمي قابل للتوسع في أي دولة بالعالم،
/// مع التركيز على جوهر التجربة: الإنقاذ، العيادات، التبني، والمجتمع.
abstract class OnboardingData {
  static List<OnboardingItem> getItems(BuildContext context) {
    return [
      OnboardingItem(
        badgeText: 'onboarding1Badge'.tr(),
        title: 'onboarding1ScreenTitle'.tr(),
        description: 'onboarding1ScreenDescription'.tr(),
        imageUrl: AppAssets.onboarding1,
        accentColor: AppColors.statusInjured,
      ),
      OnboardingItem(
        badgeText: 'onboarding2Badge'.tr(),
        title: 'onboarding2ScreenTitle'.tr(),
        description: 'onboarding2ScreenDescription'.tr(),
        imageUrl: AppAssets.onboarding2,
        accentColor: AppColors.primary,
      ),
      OnboardingItem(
        badgeText: 'onboarding3Badge'.tr(),
        title: 'onboarding3ScreenTitle'.tr(),
        description: 'onboarding3ScreenDescription'.tr(),
        imageUrl: AppAssets.onboarding3,
        accentColor: AppColors.statusRescued,
      ),
      OnboardingItem(
        badgeText: 'onboarding4Badge'.tr(),
        title: 'onboarding4ScreenTitle'.tr(),
        description: 'onboarding4ScreenDescription'.tr(),
        imageUrl: AppAssets.onboarding4,
        accentColor: AppColors.secondary,
      ),
    ];
  }
}
