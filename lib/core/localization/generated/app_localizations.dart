import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @systemLang.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemLang;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Aleefy'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Every Paw Matters'**
  String get appTagline;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @onboarding1Badge.
  ///
  /// In en, this message translates to:
  /// **'Rescue & Protect'**
  String get onboarding1Badge;

  /// No description provided for @onboarding1ScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Report & Rescue Stray Animals'**
  String get onboarding1ScreenTitle;

  /// No description provided for @onboarding1ScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Spot an injured or stray animal? Pin the location, snap a photo, and alert nearby shelters and community heroes instantly.'**
  String get onboarding1ScreenDescription;

  /// No description provided for @onboarding2Badge.
  ///
  /// In en, this message translates to:
  /// **'Verified Vets'**
  String get onboarding2Badge;

  /// No description provided for @onboarding2ScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Book Top Veterinary Clinics'**
  String get onboarding2ScreenTitle;

  /// No description provided for @onboarding2ScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Find licensed veterinary clinics near you. Choose your preferred slot, view consultation fees, and confirm in seconds.'**
  String get onboarding2ScreenDescription;

  /// No description provided for @onboarding3Badge.
  ///
  /// In en, this message translates to:
  /// **'Shelters & Care'**
  String get onboarding3Badge;

  /// No description provided for @onboarding3ScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Adopt & Support Local Shelters'**
  String get onboarding3ScreenTitle;

  /// No description provided for @onboarding3ScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Give rescued pets a loving forever home. Browse verified shelter profiles and connect directly with caretakers.'**
  String get onboarding3ScreenDescription;

  /// No description provided for @onboarding4Badge.
  ///
  /// In en, this message translates to:
  /// **'Community & Support'**
  String get onboarding4Badge;

  /// No description provided for @onboarding4ScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Join the Global Pet Lovers Hub'**
  String get onboarding4ScreenTitle;

  /// No description provided for @onboarding4ScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Share pet moments, discover pet-friendly events, ask questions, and chat directly with pet owners and veterinarians.'**
  String get onboarding4ScreenDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
