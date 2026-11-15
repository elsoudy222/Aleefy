import 'package:aleefy/aleefy/aleefy_app.dart';
import 'package:aleefy/core/constants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('AleefyApp smoke test - verifies splash initial render', (
    WidgetTester tester,
  ) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Without this, SharedPreferences.getInstance() (used by both
    // EasyLocalization.ensureInitialized() and AppCubit.load()) never
    // completes in tests, because the platform channel has no native
    // implementation there. On a real device this is not needed.
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();

    // تشغيل التطبيق واختبار ظهور اسم التطبيق والشعار
    // EasyLocalization wraps the app exactly like main.dart does,
    // otherwise '.tr()' has no translations to read.
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        saveLocale: false,
        child: const AleefyApp(),
      ),
    );
    // Let the translation files load while the splash is still showing
    // (it navigates away after 2.5s, so no pumpAndSettle here).
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text(AppConstants.appName), findsOneWidget);
    expect(find.text(AppConstants.appTagline), findsOneWidget);
  });
}
