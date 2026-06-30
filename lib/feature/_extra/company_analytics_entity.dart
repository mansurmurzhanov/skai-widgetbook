class CompanyAnalyticsEntity {
  final String name;
  final String shortName;
  final int? id;

  CompanyAnalyticsEntity({
    required this.name,
    required this.shortName,
    this.id,
  });

  String get displayLabel => shortName.isNotEmpty ? shortName : name;

  factory CompanyAnalyticsEntity.fromJson(Map<String, dynamic> json) =>
      CompanyAnalyticsEntity(
        name: json['name'],
        shortName: json['short_name'],
        id: json['id'],
      );

  static List<CompanyAnalyticsEntity> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => CompanyAnalyticsEntity.fromJson(json)).toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAnalyticsEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          shortName == other.shortName &&
          id == other.id;

  @override
  int get hashCode => Object.hash(name, shortName, id);
}
