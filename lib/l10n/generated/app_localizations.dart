import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

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
    Locale('en'),
    Locale('zh'),
    Locale('zh', 'HK'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Door Access System'**
  String get appTitle;

  /// Welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Logout button text
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Settings page title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Language setting label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Simplified Chinese language option
  ///
  /// In en, this message translates to:
  /// **'Chinese (Simplified)'**
  String get chineseSimplified;

  /// Traditional Chinese language option
  ///
  /// In en, this message translates to:
  /// **'Chinese (Traditional)'**
  String get chineseTraditional;

  /// Personnel page title
  ///
  /// In en, this message translates to:
  /// **'Personnel'**
  String get personnel;

  /// Devices page title
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get devices;

  /// Access log page title
  ///
  /// In en, this message translates to:
  /// **'Access Log'**
  String get accessLog;

  /// Backup page title
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// Server URL field label
  ///
  /// In en, this message translates to:
  /// **'Server URL'**
  String get serverUrl;

  /// Server URL field hint text
  ///
  /// In en, this message translates to:
  /// **'Enter server URL'**
  String get enterServerUrl;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Password field hint text
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// Sign in button text
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Signing in loading text
  ///
  /// In en, this message translates to:
  /// **'Signing in...'**
  String get signingIn;

  /// Server URL validation error
  ///
  /// In en, this message translates to:
  /// **'Server URL is required'**
  String get serverUrlRequired;

  /// Password validation error
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// Language selection section title
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// Devices page subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage and monitor access control devices'**
  String get manageAndMonitorDevices;

  /// Devices search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search devices by serial number, model, IP, label, or MAC...'**
  String get searchDevices;

  /// No devices message
  ///
  /// In en, this message translates to:
  /// **'No devices found.'**
  String get noDevicesFound;

  /// No devices matching search message
  ///
  /// In en, this message translates to:
  /// **'No devices found matching your search.'**
  String get noDevicesMatchingSearch;

  /// Device list header
  ///
  /// In en, this message translates to:
  /// **'Device List'**
  String get deviceList;

  /// Devices count label
  ///
  /// In en, this message translates to:
  /// **'devices'**
  String get devicesCount;

  /// IP address label
  ///
  /// In en, this message translates to:
  /// **'IP'**
  String get ip;

  /// MAC address label
  ///
  /// In en, this message translates to:
  /// **'MAC'**
  String get mac;

  /// Last modified label
  ///
  /// In en, this message translates to:
  /// **'Modified'**
  String get modified;

  /// Pagination showing label
  ///
  /// In en, this message translates to:
  /// **'Showing'**
  String get showing;

  /// Pagination to label
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// Pagination of label
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get paginationOf;

  /// Personnel page subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage personnel and access permissions'**
  String get managePersonnel;

  /// Personnel search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search personnel by name, ID, or department...'**
  String get searchPersonnel;

  /// No personnel message
  ///
  /// In en, this message translates to:
  /// **'No personnel found.'**
  String get noPersonnelFound;

  /// No personnel matching search message
  ///
  /// In en, this message translates to:
  /// **'No personnel found matching your search.'**
  String get noPersonnelMatchingSearch;

  /// Personnel list header
  ///
  /// In en, this message translates to:
  /// **'Personnel List'**
  String get personnelList;

  /// Personnel count label
  ///
  /// In en, this message translates to:
  /// **'personnel'**
  String get personnelCount;

  /// Add personnel button
  ///
  /// In en, this message translates to:
  /// **'Add Personnel'**
  String get addPersonnel;

  /// Edit personnel button
  ///
  /// In en, this message translates to:
  /// **'Edit Personnel'**
  String get editPersonnel;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Employee ID field label
  ///
  /// In en, this message translates to:
  /// **'Employee ID'**
  String get employeeId;

  /// Department field label
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// Position field label
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// Phone field label
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Access level field label
  ///
  /// In en, this message translates to:
  /// **'Access Level'**
  String get accessLevel;

  /// Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Name validation error
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// Employee ID validation error
  ///
  /// In en, this message translates to:
  /// **'Employee ID is required'**
  String get employeeIdRequired;

  /// Department validation error
  ///
  /// In en, this message translates to:
  /// **'Department is required'**
  String get departmentRequired;

  /// Position validation error
  ///
  /// In en, this message translates to:
  /// **'Position is required'**
  String get positionRequired;

  /// Phone validation error
  ///
  /// In en, this message translates to:
  /// **'Phone is required'**
  String get phoneRequired;

  /// Email validation error
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// Access level validation error
  ///
  /// In en, this message translates to:
  /// **'Access level is required'**
  String get accessLevelRequired;

  /// Access log page subtitle
  ///
  /// In en, this message translates to:
  /// **'View access logs and security events'**
  String get viewAccessLogs;

  /// Access log search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search logs by personnel, device, or event...'**
  String get searchLogs;

  /// No logs message
  ///
  /// In en, this message translates to:
  /// **'No access logs found.'**
  String get noLogsFound;

  /// No logs matching search message
  ///
  /// In en, this message translates to:
  /// **'No logs found matching your search.'**
  String get noLogsMatchingSearch;

  /// Access log list header
  ///
  /// In en, this message translates to:
  /// **'Access Log List'**
  String get accessLogList;

  /// Logs count label
  ///
  /// In en, this message translates to:
  /// **'logs'**
  String get logs;

  /// Event label
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// Time label
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// Device label
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// Access granted status
  ///
  /// In en, this message translates to:
  /// **'Granted'**
  String get granted;

  /// Access denied status
  ///
  /// In en, this message translates to:
  /// **'Denied'**
  String get denied;

  /// Backup page subtitle
  ///
  /// In en, this message translates to:
  /// **'Backup and restore system data'**
  String get backupAndRestore;

  /// Create backup button
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get createBackup;

  /// Restore backup button
  ///
  /// In en, this message translates to:
  /// **'Restore Backup'**
  String get restoreBackup;

  /// Backup success message
  ///
  /// In en, this message translates to:
  /// **'Backup created successfully'**
  String get backupCreated;

  /// Restore success message
  ///
  /// In en, this message translates to:
  /// **'Backup restored successfully'**
  String get backupRestored;

  /// Settings page subtitle
  ///
  /// In en, this message translates to:
  /// **'Configure application settings'**
  String get appSettings;

  /// General settings section
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// Security settings section
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// Notifications settings section
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// About section
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Build label
  ///
  /// In en, this message translates to:
  /// **'Build'**
  String get build;

  /// Select all checkbox label
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;
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
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'HK':
            return AppLocalizationsZhHk();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
