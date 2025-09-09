// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Door Access System';

  @override
  String get welcome => 'Welcome';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get chineseSimplified => 'Chinese (Simplified)';

  @override
  String get chineseTraditional => 'Chinese (Traditional)';

  @override
  String get personnel => 'Personnel';

  @override
  String get devices => 'Devices';

  @override
  String get accessLog => 'Access Log';

  @override
  String get backup => 'Backup';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get enterServerUrl => 'Enter server URL';

  @override
  String get password => 'Password';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get signIn => 'Sign In';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get serverUrlRequired => 'Server URL is required';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get manageAndMonitorDevices =>
      'Manage and monitor access control devices';

  @override
  String get searchDevices =>
      'Search devices by serial number, model, IP, label, or MAC...';

  @override
  String get noDevicesFound => 'No devices found.';

  @override
  String get noDevicesMatchingSearch =>
      'No devices found matching your search.';

  @override
  String get deviceList => 'Device List';

  @override
  String get devicesCount => 'devices';

  @override
  String get ip => 'IP';

  @override
  String get mac => 'MAC';

  @override
  String get modified => 'Modified';

  @override
  String get showing => 'Showing';

  @override
  String get to => 'to';

  @override
  String get paginationOf => 'of';

  @override
  String get managePersonnel => 'Manage personnel and access permissions';

  @override
  String get searchPersonnel =>
      'Search personnel by name, ID, or department...';

  @override
  String get noPersonnelFound => 'No personnel found.';

  @override
  String get noPersonnelMatchingSearch =>
      'No personnel found matching your search.';

  @override
  String get personnelList => 'Personnel List';

  @override
  String get personnelCount => 'personnel';

  @override
  String get addPersonnel => 'Add Personnel';

  @override
  String get editPersonnel => 'Edit Personnel';

  @override
  String get name => 'Name';

  @override
  String get employeeId => 'Employee ID';

  @override
  String get department => 'Department';

  @override
  String get position => 'Position';

  @override
  String get phone => 'Phone';

  @override
  String get email => 'Email';

  @override
  String get accessLevel => 'Access Level';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get employeeIdRequired => 'Employee ID is required';

  @override
  String get departmentRequired => 'Department is required';

  @override
  String get positionRequired => 'Position is required';

  @override
  String get phoneRequired => 'Phone is required';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get accessLevelRequired => 'Access level is required';

  @override
  String get viewAccessLogs => 'View access logs and security events';

  @override
  String get searchLogs => 'Search logs by personnel, device, or event...';

  @override
  String get noLogsFound => 'No access logs found.';

  @override
  String get noLogsMatchingSearch => 'No logs found matching your search.';

  @override
  String get accessLogList => 'Access Log List';

  @override
  String get logs => 'logs';

  @override
  String get event => 'Event';

  @override
  String time(int number) {
    return 'Time $number';
  }

  @override
  String get device => 'Device';

  @override
  String get granted => 'Granted';

  @override
  String get denied => 'Denied';

  @override
  String get backupAndRestore => 'Backup and restore system data';

  @override
  String get createBackup => 'Create Backup';

  @override
  String get restoreBackup => 'Restore Backup';

  @override
  String get backupCreated => 'Backup created successfully';

  @override
  String get backupRestored => 'Backup restored successfully';

  @override
  String get appSettings => 'Configure application settings';

  @override
  String get general => 'General';

  @override
  String get security => 'Security';

  @override
  String get notifications => 'Notifications';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get build => 'Build';

  @override
  String get selectAll => 'Select All';

  @override
  String get photo => 'Photo';

  @override
  String get updateImage => 'Update Image';

  @override
  String get addPhoto => 'Add Photo';

  @override
  String get basicInformation => 'Basic Information';

  @override
  String get enterPersonnelName => 'Enter personnel name';

  @override
  String get enterCardNumber => 'Enter card number';

  @override
  String get selectAccessGroup => 'Select Access Group';

  @override
  String get deviceMapping => 'Device Mapping';

  @override
  String get saving => 'Save...';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String get deletePersonnelConfirm =>
      'Are you sure you want to delete this personnel? This action cannot be undone.';

  @override
  String get delete => 'Delete';

  @override
  String get personnelUpdatedSuccessfully => 'Personnel updated successfully';

  @override
  String get personnelAddedSuccessfully => 'Personnel added successfully';

  @override
  String errorPickingImage(String error) {
    return 'Error picking image: $error';
  }

  @override
  String get admin => 'Admin';

  @override
  String get employee => 'Employee';

  @override
  String get guest => 'Guest';

  @override
  String get exportLogs => 'Export Logs';

  @override
  String get filters => 'Filters';

  @override
  String get deviceSn => 'Device (SN)';

  @override
  String get allDevices => 'All devices';

  @override
  String get personnelName => 'Personnel Name';

  @override
  String get searchByName => 'Search by name...';

  @override
  String get fromDate => 'From Date';

  @override
  String get selectFromDate => 'Select from date';

  @override
  String get toDate => 'To Date';

  @override
  String get selectToDate => 'Select to date';

  @override
  String get applyFilters => 'Apply Filters';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get noAccessLogsFound => 'No access logs found';

  @override
  String get accessLogs => 'Access Logs';

  @override
  String get exportingAccessLogs => 'Exporting access logs...';

  @override
  String accessLogsExported(String date) {
    return 'Access logs exported as access-logs-$date.csv';
  }

  @override
  String get entry => 'Entry';

  @override
  String get exit => 'Exit';

  @override
  String errorSelectingBackupFile(String error) {
    return 'Error selecting backup file: $error';
  }

  @override
  String get pleaseSelectBackupFile => 'Please select a backup file first';

  @override
  String get confirmRestore => 'Confirm Restore';

  @override
  String get confirmRestoreMessage =>
      'Are you sure you want to restore from the uploaded backup file? This action will overwrite current data and cannot be undone.';

  @override
  String get confirmRestoreButton => 'Confirm Restore';

  @override
  String get configurationSavedSuccessfully =>
      'Configuration saved successfully';

  @override
  String get actions => 'Actions';

  @override
  String get restoreFromBackup => 'Restore from Backup';

  @override
  String get uploadBackupFile => 'Upload Backup File';

  @override
  String get restoring => 'Restoring...';

  @override
  String get creatingBackup => 'Creating Backup...';

  @override
  String get backupNow => 'Backup Now';

  @override
  String get configuration => 'Configuration';

  @override
  String get enableDailyBackup => 'Enable Daily Backup';

  @override
  String get backupTime24h => 'Backup Time (24H)';

  @override
  String get backupPath => 'Backup Path';

  @override
  String get backupPathHint => '/backups/system';

  @override
  String get saveConfiguration => 'Save Configuration';

  @override
  String get saveConfigurationLoading => 'Save Configuration...';

  @override
  String get no => 'NO.';

  @override
  String get accessGroup => 'Access Group';

  @override
  String get sunday => 'Sun';

  @override
  String get monday => 'Mon';

  @override
  String get tuesday => 'Tue';

  @override
  String get wednesday => 'Wed';

  @override
  String get thursday => 'Thu';

  @override
  String get friday => 'Fri';

  @override
  String get saturday => 'Sat';

  @override
  String get hhmm => 'HH:MM';

  @override
  String get contractor => 'Contractor';

  @override
  String get visitor => 'Visitor';
}
