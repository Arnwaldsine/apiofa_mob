import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/user_profile.dart';

class ProfileLogin {
  final int id;
  final int userProfileId;
  final DateTime date;
  final String ip;
  final String userAgent;
  final bool isSuccessful;
  final UserProfile userProfile;

  ProfileLogin({
    required this.id,
    required this.userProfileId,
    required this.date,
    required this.ip,
    required this.userAgent,
    required this.isSuccessful,
    required this.userProfile,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userProfileId': userProfileId,
      'date': date.toIso8601String(),
      'ip': ip,
      'userAgent': userAgent,
      'isSuccessful': isSuccessful,
      'userProfile': userProfile.toMap(),
    };
  }

  factory ProfileLogin.fromMap(Map<String, dynamic> map) {
    return ProfileLogin(
      id: map['id'] ?? 0,
      userProfileId: map['userProfileId'] ?? 0,
      date: DateTime.parse(map['date']),
      ip: map['ip'] ?? '',
      userAgent: map['userAgent'] ?? '',
      isSuccessful: map['isSuccessful'] ?? false,
      userProfile: UserProfile.fromMap(map['userProfile']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileLogin.fromJson(String source) => ProfileLogin.fromMap(json.decode(source));

  ProfileLogin copyWith({
    int? id,
    int? userProfileId,
    DateTime? date,
    String? ip,
    String? userAgent,
    bool? isSuccessful,
    UserProfile? userProfile,
  }) {
    return ProfileLogin(
      id: id ?? this.id,
      userProfileId: userProfileId ?? this.userProfileId,
      date: date ?? this.date,
      ip: ip ?? this.ip,
      userAgent: userAgent ?? this.userAgent,
      isSuccessful: isSuccessful ?? this.isSuccessful,
      userProfile: userProfile ?? this.userProfile,
    );
  }
}
