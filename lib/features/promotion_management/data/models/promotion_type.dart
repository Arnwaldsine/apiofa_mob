import 'dart:convert';

class PromotionType {
  final int id;
  final String name;
  final String description;

  PromotionType({
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

  factory PromotionType.fromMap(Map<String, dynamic> map) {
    return PromotionType(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PromotionType.fromJson(String source) => PromotionType.fromMap(json.decode(source));

  PromotionType copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return PromotionType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}