import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/creator_profile.dart';

class UserProfileType {
  final int id;
  final String name;
  final String description;
  final List<UserProfile> userProfiles; // Uncomment when UserProfile is available

  UserProfileType({
    required this.id,
    required this.name,
    required this.description,
    required this.userProfiles, // Uncomment when UserProfile is available
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'userProfiles': userProfiles.map((x) => x.toMap()).toList(), // Uncomment when UserProfile is available
    };
  }

  factory UserProfileType.fromMap(Map<String, dynamic> map) {
    return UserProfileType(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      userProfiles: List<UserProfile>.from(map['userProfiles']?.map((x) => UserProfile.fromMap(x))), // Uncomment when UserProfile is available
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileType.fromJson(String source) => UserProfileType.fromMap(json.decode(source));

  UserProfileType copyWith({
    int? id,
    String? name,
    String? description,
    List<UserProfile>? userProfiles, // Uncomment when UserProfile is available
  }) {
    return UserProfileType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      userProfiles: userProfiles ?? this.userProfiles, // Uncomment when UserProfile is available
    );
  }

  String? validateId() {
    if (id <= 0) {
      return 'ID debe ser un número positivo';
    }
    return null;
  }

  String? validateName() {
    if (name.isEmpty) {
      return 'Introduzca un nombre';
    } else if (name.length > 50) {
      return 'Introduzca un nombre válido (máximo 50 caracteres)';
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