import 'package:aleefy/aleefy/app_cubit/app_cubit.dart';
import 'package:aleefy/core/constants/app_constants.dart';
import 'package:aleefy/core/localization/generated/app_localizations.dart';
import 'package:aleefy/core/theme/app_theme.dart';
import 'package:aleefy/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AleefyApp extends StatelessWidget {
  const AleefyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit()..load(),
      child: BlocBuilder<AppCubit, Locale?>(
        builder: (context, locale) {
          return MaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
