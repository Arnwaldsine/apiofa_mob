import 'dart:convert';

class MediaPackCategory {
  final int id;
  final String name;
  final String description;
  final bool isNSFW;

  MediaPackCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.isNSFW,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isNSFW': isNSFW,
    };
  }

  factory MediaPackCategory.fromMap(Map<String, dynamic> map) {
    return MediaPackCategory(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      isNSFW: map['isNSFW'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPackCategory.fromJson(String source) => MediaPackCategory.fromMap(json.decode(source));

  MediaPackCategory copyWith({
    int? id,
    String? name,
    String? description,
    bool? isNSFW,
  }) {
    return MediaPackCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isNSFW: isNSFW ?? this.isNSFW,
    );
  }
}