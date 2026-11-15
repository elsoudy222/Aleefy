import 'package:aleefy/aleefy/app_cubit/app_cubit.dart';
import 'package:aleefy/core/components/app_buttons.dart';
import 'package:aleefy/core/components/custom_images.dart';
import 'package:aleefy/core/constants/app_assets.dart';
import 'package:aleefy/core/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    if (_currentIndex < OnboardingData.getItems(context).length - 1) {
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
    final bool isLastPage =
        _currentIndex == OnboardingData.getItems(context).length - 1;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // شريط علوي: تخطي (Skip)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // شعار صغير واسم التطبيق
                  Row(
                    children: [
                      CustomSvgIconWidget(
                        path: AppAssets.logo,
                        height: 28.h,
                        width: 28.w,
                      ),
                      SizedBox(width: 8.w),
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
                          OnboardingData.getItems(context).length - 1,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        'skip'.tr(),
                        style: AppTypography.button.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  else
                    SizedBox(height: 48.h), // للحفاظ على توازن الارتفاع
                ],
              ),
            ),

            // محتوى الشرائح (PageView)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingData.getItems(context).length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageItem(
                    item: OnboardingData.getItems(context)[index],
                  );
                },
              ),
            ),

            // شريط سفلي: مؤشر الصفحات + الزر الأساسي (CTA)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                children: [
                  PageIndicator(
                    count: OnboardingData.getItems(context).length,
                    currentIndex: _currentIndex,
                  ),

                  // LanguageSwitcher(),
                  SizedBox(height: 35.h),
                  AppMainButton(
                    onPressed: _onNextPressed,
                    title: isLastPage ? 'getStarted'.tr() : 'next'.tr(),
                    icon: isLastPage
                        ? Icons.rocket_launch
                        : Icons.arrow_forward_rounded,
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

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, Locale?>(
      builder: (context, locale) {
        return SegmentedButton<Locale?>(
          segments: [
            ButtonSegment(value: null, label: Text(context.tr('systemLang'))),
            ButtonSegment(
              value: const Locale('ar'),
              label: Text(context.tr('arabic')),
            ),
            ButtonSegment(
              value: const Locale('en'),
              label: Text(context.tr('english')),
            ),
          ],
          selected: {locale},
          style: ButtonStyle(
            shape: WidgetStateProperty.all(const StadiumBorder()),
            // backgroundColor: WidgetStateProperty.all(Colors.orange),
          ),
          onSelectionChanged: (selection) {
            context.read<AppCubit>().changeLocale(selection.first);
          },
        );
      },
    );
  }
}
