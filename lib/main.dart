import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'features/onboarding/presentation/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AleefyApp());
}

/// نقطة انطلاق التطبيق الرئيسية
class AleefyApp extends StatelessWidget {
  const AleefyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // تبدأ رحلة المستخدم من شاشة البداية (Splash Screen)
      home: const SplashScreen(),
    );
  }
}
