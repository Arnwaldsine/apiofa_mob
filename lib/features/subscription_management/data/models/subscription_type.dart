import 'dart:convert';

class SubscriptionType {
  final int id;
  final String name;
  final String description;

  SubscriptionType({
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

  factory SubscriptionType.fromMap(Map<String, dynamic> map) {
    return SubscriptionType(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionType.fromJson(String source) => SubscriptionType.fromMap(json.decode(source));

  SubscriptionType copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return SubscriptionType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

// Validation methods

String? validateName(String value) {
  if (value.isEmpty) {
    return "Introduzca un nombre";
  }
  return null;
}

String? validateDescription(String value) {
  if (value.isEmpty) {
    return "Introduzca una descripción";
  }
  return null;
}