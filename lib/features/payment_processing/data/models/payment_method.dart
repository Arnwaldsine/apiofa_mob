import 'dart:convert';

class PaymentMethod {
  final int id;
  final String name;
  final String description;

  PaymentMethod({
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

  factory PaymentMethod.fromMap(Map<String, dynamic> map) {
    return PaymentMethod(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethod.fromJson(String source) => PaymentMethod.fromMap(json.decode(source));

  PaymentMethod copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

// Validation methods

String? validatePaymentMethodName(String value) {
  if (value.isEmpty) {
    return "Introduzca un nombre";
  }
  if (value.length > 50) {
    return "Introduzca un nombre válido (máximo 50 caracteres)";
  }
  return null;
}

String? validatePaymentMethodDescription(String value) {
  if (value.isEmpty) {
    return "Introduzca una descripción";
  }
  if (value.length > 200) {
    return "Introduzca una descripción válida (máximo 200 caracteres)";
  }
  return null;
}