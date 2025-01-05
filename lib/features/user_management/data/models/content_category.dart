import 'dart:convert';

class ContentCategory {
  final int id;
  final String name;
  final String description;

  ContentCategory({
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

  factory ContentCategory.fromMap(Map<String, dynamic> map) {
    return ContentCategory(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentCategory.fromJson(String source) => ContentCategory.fromMap(json.decode(source));

  ContentCategory copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return ContentCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  String? validateName() {
    if (name.isEmpty) {
      return 'Introduzca un nombre';
    }
    return null;
  }

  String? validateDescription() {
    if (description.isEmpty) {
      return 'Introduzca una descripción';
    } else if (description.length > 200) {
      return 'Introduzca una descripción válida (máximo 200 caracteres)';
    }
    return null;
  }
}