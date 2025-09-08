class AccessConfig {
  final String id;
  final String accessGroup;
  final List<TimeSlot> timeSlots;
  final Map<String, bool> dayAccess; // day -> has access
  final bool isEditable;

  AccessConfig({
    required this.id,
    required this.accessGroup,
    required this.timeSlots,
    required this.dayAccess,
    this.isEditable = true,
  });

  AccessConfig copyWith({
    String? accessGroup,
    List<TimeSlot>? timeSlots,
    Map<String, bool>? dayAccess,
  }) {
    return AccessConfig(
      id: id,
      accessGroup: accessGroup ?? this.accessGroup,
      timeSlots: timeSlots ?? this.timeSlots,
      dayAccess: dayAccess ?? this.dayAccess,
      isEditable: isEditable,
    );
  }
}

class TimeSlot {
  final String from;
  final String to;

  TimeSlot({
    required this.from,
    required this.to,
  });

  String get displayText => '$from~$to';

  TimeSlot copyWith({
    String? from,
    String? to,
  }) {
    return TimeSlot(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }
}

class DayOfWeek {
  static const String sunday = 'Sun';
  static const String monday = 'Mon';
  static const String tuesday = 'Tue';
  static const String wednesday = 'Wed';
  static const String thursday = 'Thu';
  static const String friday = 'Fri';
  static const String saturday = 'Sat';

  static const List<String> all = [
    sunday,
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
  ];
}
