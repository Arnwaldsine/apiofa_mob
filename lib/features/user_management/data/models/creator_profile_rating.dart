import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/creator_profile.dart';
import 'package:apiofa_mob/features/user_management/data/models/fan_profile.dart';

class CreatorProfileRating {
  final int id;
  final int rating;
  final String review;
  final int fanProfileId;
  final int creatorProfileId;
  final FanProfile fanProfile;
  final CreatorProfile creatorProfile;

  CreatorProfileRating({
    required this.id,
    required this.rating,
    required this.review,
    required this.fanProfileId,
    required this.creatorProfileId,
    required this.fanProfile,
    required this.creatorProfile,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rating': rating,
      'review': review,
      'fanProfileId': fanProfileId,
      'creatorProfileId': creatorProfileId,
      'fanProfile': fanProfile.toMap(),
      'creatorProfile': creatorProfile.toMap(),
    };
  }

  factory CreatorProfileRating.fromMap(Map<String, dynamic> map) {
    return CreatorProfileRating(
      id: map['id'] ?? 0,
      rating: map['rating'] ?? 0,
      review: map['review'] ?? '',
      fanProfileId: map['fanProfileId'] ?? 0,
      creatorProfileId: map['creatorProfileId'] ?? 0,
      fanProfile: FanProfile.fromMap(map['fanProfile']),
      creatorProfile: CreatorProfile.fromMap(map['creatorProfile']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatorProfileRating.fromJson(String source) => CreatorProfileRating.fromMap(json.decode(source));

  CreatorProfileRating copyWith({
    int? id,
    int? rating,
    String? review,
    int? fanProfileId,
    int? creatorProfileId,
    FanProfile? fanProfile,
    CreatorProfile? creatorProfile,
  }) {
    return CreatorProfileRating(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      fanProfileId: fanProfileId ?? this.fanProfileId,
      creatorProfileId: creatorProfileId ?? this.creatorProfileId,
      fanProfile: fanProfile ?? this.fanProfile,
      creatorProfile: creatorProfile ?? this.creatorProfile,
    );
  }
}

// Validation methods

String? validateRating(int value) {
  if (value < 1 || value > 5) {
    return "El rating debe estar entre 1 y 5.";
  }
  return null;
}

String? validateReview(String value) {
  if (value.length > 500) {
    return "El campo Reseña no puede tener más de 500 caracteres.";
  }
  return null;
}

String? validateFanProfileId(int value) {
  if (value == 0) {
    return "Se requiere el ID del fan que calificó.";
  }
  return null;
}

String? validateCreatorProfileId(int value) {
  if (value == 0) {
    return "Se requiere el ID del creador calificado.";
  }
  return null;
}