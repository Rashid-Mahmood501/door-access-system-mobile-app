import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';

class AccessLog {
  final String id;
  final String personnelName;
  final DateTime accessTime;
  final String deviceId;
  final String deviceName;
  final String deviceSerial;
  final AccessDirection direction;
  final String location;

  AccessLog({
    required this.id,
    required this.personnelName,
    required this.accessTime,
    required this.deviceId,
    required this.deviceName,
    required this.deviceSerial,
    required this.direction,
    required this.location,
  });

  String get formattedTime => DateFormat('MMM dd, yyyy HH:mm:ss').format(accessTime);
  String get deviceInfo => '$deviceName ($deviceSerial)';
}

enum AccessDirection {
  entry,
  exit,
}

extension AccessDirectionExtension on AccessDirection {
  String displayName(BuildContext context) {
    switch (this) {
      case AccessDirection.entry:
        return AppLocalizations.of(context)!.entry;
      case AccessDirection.exit:
        return AppLocalizations.of(context)!.exit;
    }
  }
}
