import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// تعريفات النصوص والخطوط لتطبيق Aleefy (Typography)
/// 
/// تم اعتماد خط Cairo كعائلة الخطوط الأساسية (Font Family) لكامل التطبيق،
/// حيث يدعم اللغتين الإنجليزية والعربية بأعلى درجات التناسق والوضوح،
/// ومتوافق مع إرشادات التصميم الحديثة للواجهات.
abstract class AppTypography {
  /// اسم عائلة الخط المستخدمة للتطبيق (Cairo)
  static final String? fontFamily = GoogleFonts.cairo().fontFamily;

  /// عناوين رئيسية كبيرة (Large Headings)
  static final TextStyle heading1 = GoogleFonts.cairo(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  /// عناوين متوسطة (Medium Headings)
  static final TextStyle heading2 = GoogleFonts.cairo(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  /// عناوين أقسام (Section Headings)
  static final TextStyle heading3 = GoogleFonts.cairo(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// نصوص المحتوى الكبيرة (Body Large)
  static final TextStyle bodyLarge = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// نصوص المحتوى العادية (Body Medium)
  static final TextStyle bodyMedium = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// نصوص ثانوية وتلميحات (Body Small / Hints)
  static final TextStyle bodySmall = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
  );

  /// نصوص الأزرار (Buttons)
  static final TextStyle button = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  /// التسميات الصغيرة والشارات (Captions & Badges)
  static final TextStyle caption = GoogleFonts.cairo(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
}
