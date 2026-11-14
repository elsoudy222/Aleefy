import 'package:aleefy/core/components/app_buttons.dart';
import 'package:aleefy/core/components/custom_images.dart';
import 'package:aleefy/core/constants/app_assets.dart';
import 'package:aleefy/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/datasources/onboarding_data.dart';
import '../widgets/onboarding_page_item.dart';
import '../widgets/page_indicator.dart';

/// شاشة التعريف الرئيسية (Onboarding Screen)
///
/// تتيح للمستخدم التمرير بين ميزات التطبيق الأربعة:
/// - زر تخطي (Skip) للذهاب مباشرة للخطوة التالية.
/// - زر متابعة (Next) ينقلك للشريحة التالية بسلاسة.
/// - عند الشريحة الأخيرة، يتحول الزر إلى (Get Started) للانتقال للتطبيق.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentIndex < OnboardingData.items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _onGetStarted();
    }
  }

  void _onGetStarted() {
    // سيتم التوجيه لشاشة التسجيل / تسجيل الدخول (Auth) في الخطوة القادمة
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Welcome to Aleefy! Ready for Sign Up / Login.'),
        backgroundColor: AppColors.primary,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = _currentIndex == OnboardingData.items.length - 1;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // شريط علوي: تخطي (Skip)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // شعار صغير واسم التطبيق
                  Row(
                    children: [
                      const CustomSvgIconWidget(
                        path: AppAssets.logo,
                        height: 28,
                        width: 28,
                      ),
                      const SizedBox(width: 8),
                      // const SizedBox(width: 8),
                      Text(
                        AppConstants.appName,
                        style: AppTypography.heading3.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // زر تخطي (يختفي في الصفحة الأخيرة)
                  if (!isLastPage)
                    TextButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          OnboardingData.items.length - 1,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        'Skip',
                        style: AppTypography.button.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    )
                  else
                    const SizedBox(height: 48), // للحفاظ على توازن الارتفاع
                ],
              ),
            ),

            // محتوى الشرائح (PageView)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingData.items.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageItem(item: OnboardingData.items[index]);
                },
              ),
            ),

            // شريط سفلي: مؤشر الصفحات + الزر الأساسي (CTA)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  PageIndicator(
                    count: OnboardingData.items.length,
                    currentIndex: _currentIndex,
                  ),
                  const SizedBox(height: 28),
                  AppMainButton(onPressed: () {}, title: "Login"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _onNextPressed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isLastPage ? 'Get Started' : 'Next'),
                        const SizedBox(width: 8),
                        Icon(
                          isLastPage
                              ? Icons.rocket_launch
                              : Icons.arrow_forward_rounded,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
