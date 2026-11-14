import 'package:aleefy/core/constants/app_constants.dart';
import 'package:aleefy/core/theme/app_theme.dart';
import 'package:aleefy/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AleefyApp extends StatelessWidget {
  const AleefyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
