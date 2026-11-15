import 'package:aleefy/aleefy/aleefy_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      // AppCubit owns saving the language (SharedPreferences key
      // 'locale_code'), so EasyLocalization must NOT save it too —
      // otherwise there would be two sources of truth for the locale.
      saveLocale: false,
      child: const AleefyApp(),
    ),
  );
}
