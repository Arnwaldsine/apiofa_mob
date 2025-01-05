import 'dart:convert';

class CreatorProfile extends UserProfile {
  final String contentTypeId;
  final List<ContentCategory> contentCategories;
  final List<CreatorProfileRating> creatorProfileRatings;
  final double? averageRating;
  final int totalSubs;

  CreatorProfile({
    required super.id,
    required super.name,
    required super.biography,
    required super.userProfileTypeId,
    required super.applicationUserId,
    required super.applicationUser,
    required super.userProfileType,
    required this.contentTypeId,
    required this.contentCategories,
    required this.creatorProfileRatings,
    required this.averageRating,
    required this.totalSubs,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'contentTypeId': contentTypeId,
      'contentCategories': contentCategories.map((x) => x.toMap()).toList(),
      'creatorProfileRatings': creatorProfileRatings.map((x) => x.toMap()).toList(),
      'averageRating': averageRating,
      'totalSubs': totalSubs,
    };
  }

  factory CreatorProfile.fromMap(Map<String, dynamic> map) {
    return CreatorProfile(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      biography: map['biography'] ?? '',
      userProfileTypeId: map['userProfileTypeId'] ?? 0,
      applicationUserId: map['applicationUserId'] ?? '',
      applicationUser: ApplicationUser.fromMap(map['applicationUser']),
      userProfileType: UserProfileType.fromMap(map['userProfileType']),
      contentTypeId: map['contentTypeId'] ?? '',
      contentCategories: List<ContentCategory>.from(
        map['contentCategories']?.map((x) => ContentCategory.fromMap(x)),
      ),
      creatorProfileRatings: List<CreatorProfileRating>.from(
        map['creatorProfileRatings']?.map((x) => CreatorProfileRating.fromMap(x)),
      ),
      averageRating: map['averageRating']?.toDouble(),
      totalSubs: map['totalSubs'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatorProfile.fromJson(String source) => CreatorProfile.fromMap(json.decode(source));

  CreatorProfile copyWith({
    int? id,
    String? name,
    String? biography,
    int? userProfileTypeId,
    String? applicationUserId,
    ApplicationUser? applicationUser,
    UserProfileType? userProfileType,
    String? contentTypeId,
    List<ContentCategory>? contentCategories,
    List<CreatorProfileRating>? creatorProfileRatings,
    double? averageRating,
    int? totalSubs,
  }) {
    return CreatorProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      biography: biography ?? this.biography,
      userProfileTypeId: userProfileTypeId ?? this.userProfileTypeId,
      applicationUserId: applicationUserId ?? this.applicationUserId,
      applicationUser: applicationUser ?? this.applicationUser,
      userProfileType: userProfileType ?? this.userProfileType,
      contentTypeId: contentTypeId ?? this.contentTypeId,
      contentCategories: contentCategories ?? this.contentCategories,
      creatorProfileRatings: creatorProfileRatings ?? this.creatorProfileRatings,
      averageRating: averageRating ?? this.averageRating,
      totalSubs: totalSubs ?? this.totalSubs,
    );
  }
}

// Validation methods

String? validateContentTypeId(String value) {
  if (value.isEmpty) {
    return "Introduzca un tipo de contenido";
  }
  return null;
}

String? validateAverageRating(double? value) {
  if (value != null && (value < 0 || value > 5)) {
    return "La calificación promedio debe estar entre 0 y 5";
  }
  return null;
}

String? validateTotalSubs(int value) {
  if (value < 0) {
    return "El total de suscripciones no puede ser negativo";
  }
  return null;
}

// Stub classes for completeness

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
}

class ApplicationUser {
  final String userName;
  final String email;
  final DateTime? lastLoginDate;
  final DateTime birthDate;

  ApplicationUser({
    required this.userName,
    required this.email,
    this.lastLoginDate,
    required this.birthDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'lastLoginDate': lastLoginDate?.toIso8601String(),
      'birthDate': birthDate.toIso8601String(),
    };
  }

  factory ApplicationUser.fromMap(Map<String, dynamic> map) {
    return ApplicationUser(
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      lastLoginDate: map['lastLoginDate'] != null ? DateTime.parse(map['lastLoginDate']) : null,
      birthDate: DateTime.parse(map['birthDate']),
    );
  }
}

class UserProfileType {
  final int id;
  final String name;
  final String description;

  UserProfileType({
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

  factory UserProfileType.fromMap(Map<String, dynamic> map) {
    return UserProfileType(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }
}

class ContentCategory {
  final int id;
  final String name;
  final String description;

  ContentCategory({
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

  factory ContentCategory.fromMap(Map<String, dynamic> map) {
    return ContentCategory(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }
}

class CreatorProfileRating {
  final int id;
  final double rating;
  final String comment;

  CreatorProfileRating({
    required this.id,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rating': rating,
      'comment': comment,
    };
  }

  factory CreatorProfileRating.fromMap(Map<String, dynamic> map) {
    return CreatorProfileRating(
      id: map['id'] ?? 0,
      rating: map['rating']?.toDouble() ?? 0.0,
      comment: map['comment'] ?? '',
    );
  }
}