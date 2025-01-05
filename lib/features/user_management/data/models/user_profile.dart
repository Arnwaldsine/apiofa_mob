import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/application_user.dart';
import 'package:apiofa_mob/features/user_management/data/models/user_profile_type.dart';

class UserProfile {
  final int id;
  final String name;
  final String biography;
  final int userProfileTypeId;
  final String applicationUserId;
  final ApplicationUser applicationUser;
  final UserProfileType userProfileType;

  UserProfile({
    required this.id,
    required this.name,
    required this.biography,
    required this.userProfileTypeId,
    required this.applicationUserId,
    required this.applicationUser,
    required this.userProfileType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'biography': biography,
      'userProfileTypeId': userProfileTypeId,
      'applicationUserId': applicationUserId,
      'applicationUser': applicationUser.toMap(),
      'userProfileType': userProfileType.toMap(),
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      biography: map['biography'] ?? '',
      userProfileTypeId: map['userProfileTypeId'] ?? 0,
      applicationUserId: map['applicationUserId'] ?? '',
      applicationUser: ApplicationUser.fromMap(map['applicationUser']),
      userProfileType: UserProfileType.fromMap(map['userProfileType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(json.decode(source));

  UserProfile copyWith({
    int? id,
    String? name,
    String? biography,
    int? userProfileTypeId,
    String? applicationUserId,
    ApplicationUser? applicationUser,
    UserProfileType? userProfileType,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      biography: biography ?? this.biography,
      userProfileTypeId: userProfileTypeId ?? this.userProfileTypeId,
      applicationUserId: applicationUserId ?? this.applicationUserId,
      applicationUser: applicationUser ?? this.applicationUser,
      userProfileType: userProfileType ?? this.userProfileType,
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
    } else if (name.length > 40) {
      return 'Máximo 40 caracteres';
    }
    return null;
  }

  String? validateBiography() {
    if (biography.isEmpty) {
      return 'Introduzca una descripción';
    }
    return null;
  }

  String? validateUserProfileTypeId() {
    if (userProfileTypeId <= 0) {
      return 'Introduzca un tipo de usuario válido';
    }
    return null;
  }

  String? validateApplicationUserId() {
    if (applicationUserId.isEmpty) {
      return 'Introduzca el usuario de asignación';
    }
    return null;
  }
}

