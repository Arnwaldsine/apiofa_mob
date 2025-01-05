import 'dart:convert';

class ContentPreference {
  final int id;
  final String name;
  final String? description;

  ContentPreference({
    required this.id,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory ContentPreference.fromMap(Map<String, dynamic> map) {
    return ContentPreference(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentPreference.fromJson(String source) => ContentPreference.fromMap(json.decode(source));

  ContentPreference copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return ContentPreference(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  String? validateName() {
    if (name.isEmpty) {
      return 'Introduzca un nombre para la preferencia';
    } else if (name.length > 100) {
      return 'El nombre no puede exceder los 100 caracteres';
    }
    return null;
  }

  String? validateDescription() {
    if (description != null && description!.length > 500) {
      return 'La descripción no puede exceder los 500 caracteres';
    }
    return null;
  }
}