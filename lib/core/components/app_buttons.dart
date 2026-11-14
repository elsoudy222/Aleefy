import 'package:aleefy/core/theme/app_colors.dart';
import 'package:aleefy/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppMainButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData? icon;

  const AppMainButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTypography.heading3.copyWith(
              color: AppColors.background,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          if (icon != null) Icon(icon, size: 18, color: AppColors.background),
        ],
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData? icon;

  const SecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadows: [
          BoxShadow(
            color: AppColors.secondaryLight.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTypography.heading3.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          if (icon != null) Icon(icon, size: 18, color: AppColors.primaryDark),
        ],
      ),
    );
  }
}
