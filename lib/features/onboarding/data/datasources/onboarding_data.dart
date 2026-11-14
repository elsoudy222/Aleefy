import 'package:aleefy/core/constants/app_assets.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/onboarding_item.dart';

/// مصدر بيانات شاشات التعريف (Onboarding Data Source)
///
/// تصميم عالمي قابل للتوسع في أي دولة بالعالم،
/// مع التركيز على جوهر التجربة: الإنقاذ، العيادات، التبني، والمجتمع.
abstract class OnboardingData {
  static const List<OnboardingItem> items = [
    OnboardingItem(
      badgeText: 'Rescue & Protect',
      title: 'Report & Rescue Stray Animals',
      description: 'Spot an injured or stray animal? Pin the location, snap a photo, and alert nearby shelters and community heroes instantly.',
      imageUrl: AppAssets.onboarding1,
      accentColor: AppColors.statusInjured,
    ),
    OnboardingItem(
      badgeText: 'Verified Vets',
      title: 'Book Top Veterinary Clinics',
      description: 'Find licensed veterinary clinics near you. Choose your preferred slot, view consultation fees, and confirm in seconds.',
      imageUrl: AppAssets.onboarding2,
      accentColor: AppColors.primary,
    ),
    OnboardingItem(
      badgeText: 'Shelters & Care',
      title: 'Adopt & Support Local Shelters',
      description: 'Give rescued pets a loving forever home. Browse verified shelter profiles and connect directly with caretakers.',
      imageUrl: AppAssets.onboarding3,
      accentColor: AppColors.statusRescued,
    ),
    OnboardingItem(
      badgeText: 'Pet Community',
      title: 'Join the Global Pet Lovers Hub',
      description: 'Share pet moments, discover pet-friendly events, ask questions, and chat directly with pet owners and veterinarians.',
      imageUrl: AppAssets.onboarding4,
      accentColor: AppColors.secondary,
    ),
  ];
}
