class Personnel {
  final String id;
  final String name;
  final String? cardNumber;
  final String? accessGroup;
  final String? photoUrl;
  final List<String> deviceIds;

  Personnel({
    required this.id,
    required this.name,
    this.cardNumber,
    this.accessGroup,
    this.photoUrl,
    this.deviceIds = const [],
  });

  String get cardInfo => cardNumber ?? 'N/A';
  String get groupInfo => accessGroup ?? 'N/A';
}

class AccessGroup {
  final String id;
  final String name;

  AccessGroup({
    required this.id,
    required this.name,
  });
}
