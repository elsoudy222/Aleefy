import 'package:aleefy/core/constants/app_assets.dart';
import 'package:aleefy/core/localization/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/onboarding_item.dart';

/// مصدر بيانات شاشات التعريف (Onboarding Data Source)
///
/// تصميم عالمي قابل للتوسع في أي دولة بالعالم،
/// مع التركيز على جوهر التجربة: الإنقاذ، العيادات، التبني، والمجتمع.
abstract class OnboardingData {
  static List<OnboardingItem> getItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      OnboardingItem(
        badgeText: l10n.onboarding1Badge,
        title: l10n.onboarding1ScreenTitle,
        description: l10n.onboarding1ScreenDescription,
        imageUrl: AppAssets.onboarding1,
        accentColor: AppColors.statusInjured,
      ),
      OnboardingItem(
        badgeText: l10n.onboarding2Badge,
        title: l10n.onboarding2ScreenTitle,
        description: l10n.onboarding2ScreenDescription,
        imageUrl: AppAssets.onboarding2,
        accentColor: AppColors.primary,
      ),
      OnboardingItem(
        badgeText: l10n.onboarding3Badge,
        title: l10n.onboarding3ScreenTitle,
        description: l10n.onboarding3ScreenDescription,
        imageUrl: AppAssets.onboarding3,
        accentColor: AppColors.statusRescued,
      ),
      OnboardingItem(
        badgeText: l10n.onboarding4Badge,
        title: l10n.onboarding4ScreenTitle,
        description: l10n.onboarding4ScreenDescription,
        imageUrl: AppAssets.onboarding4,
        accentColor: AppColors.secondary,
      ),
    ];
  }
}
