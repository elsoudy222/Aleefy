import 'package:flutter/material.dart';

/// كائن بيانات شاشة التعريف (Onboarding Entity)
///
/// يمثل الشريحة الواحدة داخل شاشات التعريف الأربعة في فيجما:
/// 1. إنقاذ حيوانات الشوارع (Stray Rescue)
/// 2. حجز العيادات البيطرية (Vets & Clinics)
/// 3. التبني والملاجئ (Shelters & Adoption)
/// 4. مجتمع وفعاليات الحيوانات (Community & Events)
class OnboardingItem {
  final String title;
  final String description;
  final String imageUrl;
  final String badgeText;
  final Color accentColor;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.badgeText,
    required this.accentColor,
  });
}
