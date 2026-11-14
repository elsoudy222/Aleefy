/// مسارات جميع الأصول والصور والأيقونات داخل التطبيق (App Assets)
///
/// قاعدة معمارية: ممنوع كتابة مسار صورة مباشرة داخل الـ Widget (مثل "assets/...").
/// تجميع المسارات هنا يمنع أخطاء الـ Typo، ويسهل تغيير أسماء الملفات بضغطة زر واحدة.
abstract class AppAssets {
  // Base Directories
  static const String _svgsPath = 'assets/svgs';
  static const String _imagesPath = 'assets/images';

  // Brand Logos
  static const String logo = '$_svgsPath/logo/logo.svg';
  static const String logoWordmark = '$_svgsPath/logo/logo_wordmark.svg';
  static const String aleefyLogo = '$_svgsPath/logo/aleefy_logo.svg';
  static const String appIconPng = '$_imagesPath/app_icon.png';

  // Onboarding Illustrations (SVG)
  static const String onboarding1 = '$_svgsPath/onboarding/onboarding_1.svg';
  static const String onboarding2 = '$_svgsPath/onboarding/onboarding_2.svg';
  static const String onboarding3 = '$_svgsPath/onboarding/onboarding_3.svg';
  static const String onboarding4 = '$_svgsPath/onboarding/onboarding_4.svg';
  static const String getStarted = '$_svgsPath/onboarding/get_started.svg';

  // Common Icons Directory
  static const String iconsDir = '$_svgsPath/icons';
}
