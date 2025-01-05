import 'dart:convert';

class MediaType {
  final String id;
  final String name;
  final String description;

  MediaType({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory MediaType.fromMap(Map<String, dynamic> map) {
    return MediaType(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaType.fromJson(String source) => MediaType.fromMap(json.decode(source));

  MediaType copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return MediaType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}