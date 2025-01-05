import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/application_user.dart';
import 'package:apiofa_mob/features/user_management/data/models/content_preference.dart';
import 'package:apiofa_mob/features/user_management/data/models/user_profile.dart';
import 'package:apiofa_mob/features/user_management/data/models/user_profile_type.dart';

class FanProfile extends UserProfile {
  final int contentPreferenceId;
  final ContentPreference contentPreference;
  final bool wantsNotifications;
  final String profilePicture;
FanProfile({
    required super.id,
    required super.name,
    required super.biography,
    required super.userProfileTypeId,
    required super.applicationUserId,
    required this.contentPreferenceId,
    required this.contentPreference,
    required this.wantsNotifications,
    required this.profilePicture,
    required super.applicationUser, // Changed to required
    required super.userProfileType, // Changed to required
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'contentPreferenceId': contentPreferenceId,
      'contentPreference': contentPreference.toMap(),
      'wantsNotifications': wantsNotifications,
      'profilePicture': profilePicture,
    };
  }

  factory FanProfile.fromMap(Map<String, dynamic> map) {
    return FanProfile(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      biography: map['biography'] ?? '',
      userProfileTypeId: map['userProfileTypeId'] ?? 0,
      applicationUserId: map['applicationUserId'] ?? '',
      contentPreferenceId: map['contentPreferenceId'] ?? 0,
      contentPreference: ContentPreference.fromMap(map['contentPreference']),
      wantsNotifications: map['wantsNotifications'] ?? false,
      profilePicture: map['profilePicture'] ?? '',
      applicationUser: ApplicationUser.fromMap(map['applicationUser']), // Adjust as necessary
      userProfileType: UserProfileType.fromMap(map['userProfileType']), // Adjust as necessary
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory FanProfile.fromJson(String source) => FanProfile.fromMap(json.decode(source));

  @override
  FanProfile copyWith({
    int? id,
    String? name,
    String? biography,
    int? userProfileTypeId,
    String? applicationUserId,
    int? contentPreferenceId,
    ContentPreference? contentPreference,
    bool? wantsNotifications,
    String? profilePicture,
    ApplicationUser? applicationUser,
    UserProfileType? userProfileType,
  }) {
    return FanProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      biography: biography ?? this.biography,
      userProfileTypeId: userProfileTypeId ?? this.userProfileTypeId,
      applicationUserId: applicationUserId ?? this.applicationUserId,
      contentPreferenceId: contentPreferenceId ?? this.contentPreferenceId,
      contentPreference: contentPreference ?? this.contentPreference,
      wantsNotifications: wantsNotifications ?? this.wantsNotifications,
      profilePicture: profilePicture ?? this.profilePicture,
      applicationUser: applicationUser ?? this.applicationUser,
      userProfileType: userProfileType ?? this.userProfileType,
    );
  }
}




