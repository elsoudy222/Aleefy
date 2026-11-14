import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// مؤشر الصفحات التفاعلي (Animated Page Indicator)
/// 
/// يتحرك بسلاسة عند التمرير بين الشاشات:
/// - الصفحة النشطة: مستطيل عريض (Pill) بلون الهوية.
/// - الصفحات غير النشطة: دوائر رمادية هادئة.
class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 28 : 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.border,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
