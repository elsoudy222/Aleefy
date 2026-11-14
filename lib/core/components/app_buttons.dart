import 'package:aleefy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppMainButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AppMainButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(title), const SizedBox(width: 8)],
      ),
    );
  }
}
