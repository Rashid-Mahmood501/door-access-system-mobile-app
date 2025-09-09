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

  /// Time slot column header
  ///
  /// In en, this message translates to:
  /// **'Time {number}'**
  String time(int number);

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

  /// Photo section header
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// Update image button text
  ///
  /// In en, this message translates to:
  /// **'Update Image'**
  String get updateImage;

  /// Add photo button text
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhoto;

  /// Basic information section header
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformation;

  /// Name field hint text
  ///
  /// In en, this message translates to:
  /// **'Enter personnel name'**
  String get enterPersonnelName;

  /// Card number field hint text
  ///
  /// In en, this message translates to:
  /// **'Enter card number'**
  String get enterCardNumber;

  /// Access group dropdown hint text
  ///
  /// In en, this message translates to:
  /// **'Select Access Group'**
  String get selectAccessGroup;

  /// Device mapping section header
  ///
  /// In en, this message translates to:
  /// **'Device Mapping'**
  String get deviceMapping;

  /// Saving loading text
  ///
  /// In en, this message translates to:
  /// **'Save...'**
  String get saving;

  /// Delete confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// Delete confirmation dialog message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this personnel? This action cannot be undone.'**
  String get deletePersonnelConfirm;

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Personnel update success message
  ///
  /// In en, this message translates to:
  /// **'Personnel updated successfully'**
  String get personnelUpdatedSuccessfully;

  /// Personnel add success message
  ///
  /// In en, this message translates to:
  /// **'Personnel added successfully'**
  String get personnelAddedSuccessfully;

  /// Image picker error message
  ///
  /// In en, this message translates to:
  /// **'Error picking image: {error}'**
  String errorPickingImage(String error);

  /// Admin access group
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// Employee access group
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// Guest access group
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// Export logs button text
  ///
  /// In en, this message translates to:
  /// **'Export Logs'**
  String get exportLogs;

  /// Filters section header
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// Device selection label
  ///
  /// In en, this message translates to:
  /// **'Device (SN)'**
  String get deviceSn;

  /// All devices option
  ///
  /// In en, this message translates to:
  /// **'All devices'**
  String get allDevices;

  /// Personnel name field label
  ///
  /// In en, this message translates to:
  /// **'Personnel Name'**
  String get personnelName;

  /// Personnel name search hint
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get searchByName;

  /// From date field label
  ///
  /// In en, this message translates to:
  /// **'From Date'**
  String get fromDate;

  /// From date selection hint
  ///
  /// In en, this message translates to:
  /// **'Select from date'**
  String get selectFromDate;

  /// To date field label
  ///
  /// In en, this message translates to:
  /// **'To Date'**
  String get toDate;

  /// To date selection hint
  ///
  /// In en, this message translates to:
  /// **'Select to date'**
  String get selectToDate;

  /// Apply filters button text
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// Clear filters button text
  ///
  /// In en, this message translates to:
  /// **'Clear Filters'**
  String get clearFilters;

  /// No access logs message
  ///
  /// In en, this message translates to:
  /// **'No access logs found'**
  String get noAccessLogsFound;

  /// Access logs list header
  ///
  /// In en, this message translates to:
  /// **'Access Logs'**
  String get accessLogs;

  /// Export progress message
  ///
  /// In en, this message translates to:
  /// **'Exporting access logs...'**
  String get exportingAccessLogs;

  /// Export success message
  ///
  /// In en, this message translates to:
  /// **'Access logs exported as access-logs-{date}.csv'**
  String accessLogsExported(String date);

  /// Entry direction label
  ///
  /// In en, this message translates to:
  /// **'Entry'**
  String get entry;

  /// Exit direction label
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// Backup file selection error message
  ///
  /// In en, this message translates to:
  /// **'Error selecting backup file: {error}'**
  String errorSelectingBackupFile(String error);

  /// Backup file selection required message
  ///
  /// In en, this message translates to:
  /// **'Please select a backup file first'**
  String get pleaseSelectBackupFile;

  /// Restore confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Confirm Restore'**
  String get confirmRestore;

  /// Restore confirmation dialog message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to restore from the uploaded backup file? This action will overwrite current data and cannot be undone.'**
  String get confirmRestoreMessage;

  /// Confirm restore button text
  ///
  /// In en, this message translates to:
  /// **'Confirm Restore'**
  String get confirmRestoreButton;

  /// Configuration save success message
  ///
  /// In en, this message translates to:
  /// **'Configuration saved successfully'**
  String get configurationSavedSuccessfully;

  /// Actions section header
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// Restore section title
  ///
  /// In en, this message translates to:
  /// **'Restore from Backup'**
  String get restoreFromBackup;

  /// Upload backup file button text
  ///
  /// In en, this message translates to:
  /// **'Upload Backup File'**
  String get uploadBackupFile;

  /// Restoring loading text
  ///
  /// In en, this message translates to:
  /// **'Restoring...'**
  String get restoring;

  /// Creating backup loading text
  ///
  /// In en, this message translates to:
  /// **'Creating Backup...'**
  String get creatingBackup;

  /// Backup now button text
  ///
  /// In en, this message translates to:
  /// **'Backup Now'**
  String get backupNow;

  /// Configuration section header
  ///
  /// In en, this message translates to:
  /// **'Configuration'**
  String get configuration;

  /// Enable daily backup checkbox label
  ///
  /// In en, this message translates to:
  /// **'Enable Daily Backup'**
  String get enableDailyBackup;

  /// Backup time field label
  ///
  /// In en, this message translates to:
  /// **'Backup Time (24H)'**
  String get backupTime24h;

  /// Backup path field label
  ///
  /// In en, this message translates to:
  /// **'Backup Path'**
  String get backupPath;

  /// Backup path field hint
  ///
  /// In en, this message translates to:
  /// **'/backups/system'**
  String get backupPathHint;

  /// Save configuration button text
  ///
  /// In en, this message translates to:
  /// **'Save Configuration'**
  String get saveConfiguration;

  /// Save configuration loading text
  ///
  /// In en, this message translates to:
  /// **'Save Configuration...'**
  String get saveConfigurationLoading;

  /// Number column header
  ///
  /// In en, this message translates to:
  /// **'NO.'**
  String get no;

  /// Access group column header
  ///
  /// In en, this message translates to:
  /// **'Access Group'**
  String get accessGroup;

  /// Sunday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunday;

  /// Monday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monday;

  /// Tuesday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesday;

  /// Wednesday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesday;

  /// Thursday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursday;

  /// Friday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friday;

  /// Saturday abbreviation
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturday;

  /// Time format hint
  ///
  /// In en, this message translates to:
  /// **'HH:MM'**
  String get hhmm;

  /// Contractor access group
  ///
  /// In en, this message translates to:
  /// **'Contractor'**
  String get contractor;

  /// Visitor access group
  ///
  /// In en, this message translates to:
  /// **'Visitor'**
  String get visitor;
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
