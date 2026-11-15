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
  // The BuildContext is REQUIRED here (not just for the signature):
  // context.tr() asks Flutter for the translations of the current locale
  // AND registers this widget as "interested" in the locale, so when the
  // language changes the screen rebuilds with the new texts automatically.
  // The plain 'key'.tr() form only reads a global value and does NOT
  // rebuild the screen, so the old language would stay on screen.
  static List<OnboardingItem> getItems(BuildContext context) {
    return [
      OnboardingItem(
        badgeText: context.tr('onboarding1Badge'),
        title: context.tr('onboarding1ScreenTitle'),
        description: context.tr('onboarding1ScreenDescription'),
        imageUrl: AppAssets.onboarding1,
        accentColor: AppColors.statusInjured,
      ),
      OnboardingItem(
        badgeText: context.tr('onboarding2Badge'),
        title: context.tr('onboarding2ScreenTitle'),
        description: context.tr('onboarding2ScreenDescription'),
        imageUrl: AppAssets.onboarding2,
        accentColor: AppColors.primary,
      ),
      OnboardingItem(
        badgeText: context.tr('onboarding3Badge'),
        title: context.tr('onboarding3ScreenTitle'),
        description: context.tr('onboarding3ScreenDescription'),
        imageUrl: AppAssets.onboarding3,
        accentColor: AppColors.statusRescued,
      ),
      OnboardingItem(
        badgeText: context.tr('onboarding4Badge'),
        title: context.tr('onboarding4ScreenTitle'),
        description: context.tr('onboarding4ScreenDescription'),
        imageUrl: AppAssets.onboarding4,
        accentColor: AppColors.secondary,
      ),
    ];
  }
}
