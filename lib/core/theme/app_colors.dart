import 'package:flutter/material.dart';

/// Centralized color palette for the Aleefy application.
/// 
/// Rule of thumb: Never hardcode `Color(0xFF...)` inside UI widgets!
/// Centralizing colors makes dark mode, white-labeling, and design updates instant.
abstract class AppColors {
  // Brand Primary
  static const Color primary = Color(0xFFFF6A00); // Warm Energetic Orange
  static const Color primaryLight = Color(0xFFFF8E3C);
  static const Color primaryDark = Color(0xFFD95700);
  static const Color primarySoft = Color(0xFFFFF0E6); // Light tint for tags/badges

  // Secondary & Accents
  static const Color secondary = Color(0xFF2A3B5C); // Deep Trust Navy
  static const Color secondaryLight = Color(0xFF4A5D82);

  // Status & Rescue Badges (Used in stray animal reports)
  static const Color statusInjured = Color(0xFFE53935); // Urgent Red
  static const Color statusStray = Color(0xFFFFA000);   // Amber Warning
  static const Color statusRescued = Color(0xFF10B981); // Emerald Green
  static const Color statusPending = Color(0xFF3B82F6); // Info Blue

  // Neutrals & Backgrounds
  static const Color background = Color(0xFFF9FAFB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);

  // Typography Colors
  static const Color textPrimary = Color(0xFF111827);   // Darkest Slate
  static const Color textSecondary = Color(0xFF6B7280); // Muted Gray
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textLight = Color(0xFFFFFFFF);
}
