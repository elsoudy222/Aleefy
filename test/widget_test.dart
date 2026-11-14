import 'package:aleefy/aleefy_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aleefy/core/constants/app_constants.dart';

void main() {
  testWidgets('AleefyApp smoke test - verifies splash initial render', (
    WidgetTester tester,
  ) async {
    // تشغيل التطبيق واختبار ظهور اسم التطبيق والشعار
    await tester.pumpWidget(const AleefyApp());

    expect(find.text(AppConstants.appName), findsOneWidget);
    expect(find.text(AppConstants.appTagline), findsOneWidget);
  });
}
