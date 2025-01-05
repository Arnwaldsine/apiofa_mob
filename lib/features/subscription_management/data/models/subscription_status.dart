import 'dart:convert';

class SubscriptionStatus {
  final int id;
  final String name;
  final String description;

  SubscriptionStatus({
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

  factory SubscriptionStatus.fromMap(Map<String, dynamic> map) {
    return SubscriptionStatus(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionStatus.fromJson(String source) => SubscriptionStatus.fromMap(json.decode(source));

  SubscriptionStatus copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return SubscriptionStatus(
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