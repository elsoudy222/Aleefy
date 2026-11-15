import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  // NOTE: these are getters (not static final) on purpose. A static final
  // is evaluated once when the class is first used — possibly before
  // ScreenUtilInit runs — and '.sp' before that throws. A getter is
  // evaluated lazily on every use, always after ScreenUtil is ready.
  /// عناوين رئيسية كبيرة (Large Headings)
  static TextStyle get heading1 => GoogleFonts.cairo(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      );

  /// عناوين متوسطة (Medium Headings)
  static TextStyle get heading2 => GoogleFonts.cairo(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        letterSpacing: -0.3,
      );

  /// عناوين أقسام (Section Headings)
  static TextStyle get heading3 => GoogleFonts.cairo(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  /// نصوص المحتوى الكبيرة (Body Large)
  static TextStyle get bodyLarge => GoogleFonts.cairo(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  /// نصوص المحتوى العادية (Body Medium)
  static TextStyle get bodyMedium => GoogleFonts.cairo(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  /// نصوص ثانوية وتلميحات (Body Small / Hints)
  static TextStyle get bodySmall => GoogleFonts.cairo(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textHint,
      );

  /// نصوص الأزرار (Buttons)
  static TextStyle get button => GoogleFonts.cairo(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 0.2,
      );

  /// التسميات الصغيرة والشارات (Captions & Badges)
  static TextStyle get caption => GoogleFonts.cairo(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      );
}
