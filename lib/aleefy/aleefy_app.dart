import 'package:aleefy/aleefy/app_cubit/app_cubit.dart';
import 'package:aleefy/core/constants/app_constants.dart';
import 'package:aleefy/core/theme/app_theme.dart';
import 'package:aleefy/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AleefyApp extends StatelessWidget {
  const AleefyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit()..load(),
      // AppCubit stays the single source of truth for the locale.
      // Whenever it changes, this listener syncs EasyLocalization
      // (which owns the actual translated texts) to the same locale.
      // Nothing here calls the cubit back, so this cannot loop:
      // the sync only flows Cubit -> EasyLocalization.
      //
      // IMPORTANT: there is deliberately no BlocBuilder here.
      // MaterialApp reads its locale from EasyLocalization
      // (context.locale), so it rebuilds only after EasyLocalization
      // has finished loading the new language. A BlocBuilder would
      // rebuild MaterialApp the moment the cubit emits - before the
      // new translations are loaded - switching the app to the new
      // locale with the OLD texts, and the texts would never reload.
      child: BlocListener<AppCubit, Locale?>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, locale) async {
          final easy = EasyLocalization.of(context);
          if (easy == null) return;
          if (locale == null) {
            // null means "system language": follow the device locale.
            await easy.resetLocale();
          } else {
            await easy.setLocale(locale);
          }
        },
        child: ScreenUtilInit(
          designSize: const Size(402, 874),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
