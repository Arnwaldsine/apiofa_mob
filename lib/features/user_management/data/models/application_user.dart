import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/creator_profile.dart';
import 'package:apiofa_mob/features/user_management/data/models/refresh_token.dart';
import 'package:apiofa_mob/features/user_management/data/models/user_block.dart';

class ApplicationUser {
  final String userName;
  final String email;
  final DateTime? lastLoginDate;
  final DateTime birthDate;
  final List<UserBlock> blockedUsers; // Uncomment when UserBlock is available
  final List<RefreshToken> refreshTokens; // Uncomment when RefreshToken is available
  final List<UserProfile> userProfiles; // Uncomment when UserProfile is available

  ApplicationUser({
    required this.userName,
    required this.email,
    this.lastLoginDate,
    required this.birthDate,
    required this.blockedUsers, // Uncomment when UserBlock is available
    required this.refreshTokens, // Uncomment when RefreshToken is available
    required this.userProfiles, // Uncomment when UserProfile is available
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'lastLoginDate': lastLoginDate?.toIso8601String(),
      'birthDate': birthDate.toIso8601String(),
      'blockedUsers': blockedUsers.map((x) => x.toMap()).toList(), // Uncomment when UserBlock is available
      'refreshTokens': refreshTokens.map((x) => x.toMap()).toList(), // Uncomment when RefreshToken is available
      'userProfiles': userProfiles.map((x) => x.toMap()).toList(), // Uncomment when UserProfile is available
    };
  }

  factory ApplicationUser.fromMap(Map<String, dynamic> map) {
    return ApplicationUser(
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      lastLoginDate: map['lastLoginDate'] != null ? DateTime.parse(map['lastLoginDate']) : null,
      birthDate: DateTime.parse(map['birthDate']),
      blockedUsers: List<UserBlock>.from(map['blockedUsers']?.map((x) => UserBlock.fromMap(x))), // Uncomment when UserBlock is available
      refreshTokens: List<RefreshToken>.from(map['refreshTokens']?.map((x) => RefreshToken.fromMap(x))), // Uncomment when RefreshToken is available
      userProfiles: List<UserProfile>.from(map['userProfiles']?.map((x) => UserProfile.fromMap(x))), // Uncomment when UserProfile is available
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplicationUser.fromJson(String source) => ApplicationUser.fromMap(json.decode(source));

  ApplicationUser copyWith({
    String? userName,
    String? email,
    DateTime? lastLoginDate,
    DateTime? birthDate,
    List<UserBlock>? blockedUsers, // Uncomment when UserBlock is available
    List<RefreshToken>? refreshTokens, // Uncomment when RefreshToken is available
    List<UserProfile>? userProfiles, // Uncomment when UserProfile is available
  }) {
    return ApplicationUser(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
      birthDate: birthDate ?? this.birthDate,
      blockedUsers: blockedUsers ?? this.blockedUsers, // Uncomment when UserBlock is available
      refreshTokens: refreshTokens ?? this.refreshTokens, // Uncomment when RefreshToken is available
      userProfiles: userProfiles ?? this.userProfiles, // Uncomment when UserProfile is available
    );
  }

  String? validateUserName() {
    if (userName.isEmpty) {
      return 'Introduzca un nombre de usuario';
    }
    return null;
  }

  String? validateEmail() {
    if (email.isEmpty) {
      return 'Introduzca un correo electrónico';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return 'Introduzca un correo electrónico válido';
    }
    return null;
  }

  String? validateBirthDate() {
    if (birthDate.isAfter(DateTime.now())) {
      return 'La fecha de nacimiento no puede ser en el futuro';
    }
    return null;
  }
}
