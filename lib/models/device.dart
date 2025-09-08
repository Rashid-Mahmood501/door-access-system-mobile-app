class Device {
  final String id;
  final String? label;
  final String? modelName;
  final String? serialNumber;
  final String? currentIp;
  final String? mac;
  final DeviceStatus status;
  final DateTime lastModified;

  Device({
    required this.id,
    this.label,
    this.modelName,
    this.serialNumber,
    this.currentIp,
    this.mac,
    required this.status,
    required this.lastModified,
  });

  String get displayName => label ?? serialNumber ?? 'No Label';
  String get modelInfo => modelName ?? 'Unknown Model';
  String get serialInfo => serialNumber ?? 'No Serial';
  String get ipInfo => currentIp ?? 'No IP';
  String get macInfo => mac ?? 'No MAC';
}

enum DeviceStatus {
  online,
  offline,
  warning,
}

extension DeviceStatusExtension on DeviceStatus {
  String get displayName {
    switch (this) {
      case DeviceStatus.online:
        return 'Online';
      case DeviceStatus.offline:
        return 'Offline';
      case DeviceStatus.warning:
        return 'Warning';
    }
  }
}
